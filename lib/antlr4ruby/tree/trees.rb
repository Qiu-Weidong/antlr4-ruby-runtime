module Antlr4ruby
  module Tree
    class Trees

      class << self
        def to_string_tree(tree, recognizer: nil, rule_names: [])
          rule_names = recognizer.get_rule_names if recognizer
          # todo 转义处理
          s = get_node_text(tree, rule_names: rule_names)
          return s if tree.get_child_count <= 0
          tree.get_child_count.times do |i|
            child = tree.get_child(i)
            s += ' ' + to_string_tree(child, rule_names:rule_names) if child
          end
          "(#{s})"
        end

        def get_node_text(tree, recognizer: nil, rule_names: [])

          rule_names = recognizer.get_rule_names if recognizer
          if tree.instance_of?(RuleContext)
            rule_index = tree.get_rule_context.get_rule_index
            return rule_names[rule_index]
          elsif tree.instance_of?(ErrorNode)
            return tree.to_s
          elsif tree.instance_of?(TerminalNode)
            symbol = tree.get_symbol
            return symbol.get_text if symbol
          end
          tree.get_payload.to_s
        end

        def get_children(tree)
          kids = []
          tree.get_child_count.times do |i|
            kids.push(tree.get_child(i))
          end
          kids
        end

        def get_ancestors(tree)
          return [] if tree.get_parent == nil
          ancestors = []
          tree = tree.get_parent
          while tree
            ancestors.push(tree)
            tree = tree.get_parent
          end
          ancestors
        end

        def is_ancestor_of?(t, u)
          return false if t == nil || u == nil || t.get_parent == nil
          p = u.get_parent
          while p
            return true if t.equal?(p)
            p = p.get_parent
          end
          false
        end

        def find_all_token_nodes(t, token_type)
          find_all_nodes(t, token_type, true)
        end

        def find_all_rule_nodes(t, rule_index)
          find_all_nodes(t, rule_index, false)
        end

        def find_all_nodes(t, index, find_tokens)
          nodes = []
          _find_all_nodes(t, index, find_tokens, nodes)
          nodes
        end

        def _find_all_nodes(t, index, find_tokens, nodes)
          if find_tokens && t.instance_of?(TerminalNode)
            nodes.push(t) if t.get_symbol.get_type == index
          elsif !find_tokens && t.instance_of?(ParserRuleContext)
            nodes.push(t) if t.get_rule_index == index
          end

          t.get_child_count.times do |i|
            child = t.get_child(i)
            _find_all_nodes(child, index, find_tokens, nodes) if child
          end
        end

        def get_descendants(t)
          nodes = [t]
          n = t.get_child_count
          n.times do |i|
            child = t.get_child(i)
            nodes.push(*get_descendants(child)) if child
          end
          nodes
        end

        def get_root_of_subtree_enclosing_region(t, start_token_index, stop_token_index)
          n = t.get_child_count
          n.times do |i|
            child = t.get_child(i)
            if child
              r = get_root_of_subtree_enclosing_region(child, start_token_index, stop_token_index)
              return r if r
            end

          end
          if t.instance_of?(ParserRuleContext)
            return t if start_token_index >= t.get_start.get_token_index && (t.get_stop == nil || stop_token_index <= t.get_stop.get_token_index)
          end
          nil
        end

        def strip_children_out_of_range(t, root, start_index, stop_index)
          if t == nil
            return
          end

          t.get_child_count.times do |i|
            child = t.get_child(i)
            if child and child.instance_of?(ParserRuleContext)
              range = child.get_source_interval
              if (range.b < start_index || range.a > stop_index) && is_ancestor_of?(child, root)
                abbrev = CommonToken.new(type: Token::INVALID_TYPE, text: '...')
                t.children[i] = TerminalNode.new(abbrev)
              end
            end

          end
        end

        def find_node_such_that(t, pred)
          if pred.test(t)
            return t
          end

          unless t
            return nil
          end

          n = t.get_child_count
          n.times do |i|
            u = find_node_such_that(t.get_child(i), pred)
            if u
              return u
            end
          end
          nil

        end

      end

    end

  end
end


# Antlr4ruby

**暫未完成，敬請期待**

## 安裝
使用 `bundle` 安裝：
```
$ bundle add antlr4ruby
```
如果不想使用 `bundle`， 那麽使用如下命令安裝
```
$ gem install antlr4ruby
```

## 使用示例
見 [examples](examples)

## 開發

運行 `bin/setup` 來安裝依賴項。 然後，運行 `rake spec` 來運行測試。 您還可以運行 `bin/console` 以獲得交互式提示，這將允許您進行實驗。

要將此 `gem` 安裝到本地機器上，請運行 `bundle exec rake install`。 要發布新版本，請更新 `version.rb` 中的版本號，然後運行 `bundle exec rake release` ，這將為該版本創建一個 `git` 標籤，推送 `git` 提交和創建的標籤，然後推送 `. gem` 文件到 [rubygems.org](https://rubygems.org)。

## 貢獻

歡迎在 GitHub https://github.com/Qiu-Weidong/antlr4ruby 上提交錯誤報告和拉取請求。 該項目旨在成為一個安全、友好的協作空間，貢獻者應遵守[行為準則](https://github.com/Qiu-Weidong/antlr4ruby/blob/master/CODE_OF_CONDUCT.md) .

## 開源協議

根據 [MIT 許可證](https://opensource.org/licenses/MIT) 的條款，該 gem 可作為開源使用。

## 進度
- [ ] atn
  - [X] lexer_action_executor.rb
  - [x] lexer_action_type.rb
  - [x] lexer_channel_action.rb
  - [x] lexer_custom_action.rb
  - [x] lexer_indexed_custom_action.rb
  - [x] lexer_mode_action.rb
  - [x] lexer_more_action.rb
  - [x] lexer_pop_mode_action.rb
  - [x] lexer_push_mode_action.rb
  - [x] lexer_skip_action.rb
  - [x] lexer_type_action.rb
  - [x] atn.rb
  - [x] atn_deserialization_options.rb
  - [x] atn_deserializer.rb
  - [ ] ~~atn_serializer.rb~~
  - [ ] atn_simulator.rb
  - [ ] ~~atn_type.rb~~
  - [ ] atn_config.rb
  - [ ] atn_config_set.rb
  - [ ] lexer_atn_config.rb
  - [ ] ordered_atn_config_set.rb
  - [ ] array_prediction_context.rb
  - [ ] empty_prediction_context.rb
  - [ ] prediction_context.rb
  - [ ] prediction_context_cache.rb
  - [ ] semantic_context.rb
  - [ ] singleton_prediction_context.rb
  - [x] accept_state_info.rb
  - [x] ambiguity_info.rb
  - [x] conflict_info.rb
  - [x] context_sensitivity_info.rb
  - [x] decision_event_info.rb
  - [x] decision_info.rb
  - [x] error_info.rb
  - [x] lookahead_event_info.rb
  - [ ] parse_info.rb
  - [ ] predicate_eval_info.rb
  - [ ] lexer_atn_simulator.rb
  - [ ] ll1_analyzer.rb
  - [ ] parser_atn_simulator.rb
  - [ ] prediction_mode.rb
  - [ ] profiling_atn_simulator.rb
  - [x] atn_state.rb
  - [x] basic_block_start_state.rb
  - [x] basic_state.rb
  - [x] block_end_state.rb
  - [x] block_start_state.rb
  - [x] decision_state.rb
  - [x] invalid_state.rb
  - [x] loop_end_state.rb
  - [x] plus_block_start_state.rb
  - [x] plus_loopback_state.rb
  - [x] rule_start_state.rb
  - [x] rule_stop_state.rb
  - [x] simulator_state.rb
  - [x] star_block_start_state.rb
  - [x] star_loopback_state.rb
  - [x] star_loop_entry_state.rb
  - [x] tokens_start_state.rb
  - [x] abstract_predicate_transition.rb
  - [x] action_transition.rb
  - [x] atom_transition.rb
  - [ ] ~~code_point_transitions.rb~~
  - [x] epsilon_transition.rb
  - [x] not_set_transition.rb
  - [ ] precedence_predicate_transition.rb
  - [ ] predicate_transition.rb
  - [x] range_transition.rb
  - [x] rule_transition.rb
  - [x] set_transition.rb
  - [x] transition.rb
  - [x] wildcard_transition.rb
- [x] bail_error_strategy.rb
- [x] base_error_listener.rb
- [x] buffered_token_stream.rb
- [x] char_streams.rb
- [ ] ~~code_point_buffer.rb~~
- [x] code_point_char_stream.rb
- [x] common_token.rb
- [x] common_token_factory.rb
- [x] common_token_stream.rb
- [x] console_error_listener.rb
- [ ] default_error_strategy.rb
- [x] dfa
  - [x] dfa.rb
  - [x] dfa_serializer.rb
  - [x] dfa_state.rb
  - [x] lexer_dfa_serializer.rb
- [ ] diagnostic_error_listener.rb
- [x] exception
- [x] interpreter_rule_context.rb
- [x] int_stream.rb
- [x] lexer.rb
- [ ] lexer_interpreter.rb
- [ ] ~~list_token_source.rb~~
- [ ] misc
  - [ ] bit_set.rb
  - [ ] ~~double_key_map.rb~~
  - [ ] ~~integer_stack.rb~~
  - [x] murmur_hash.rb
  - [ ] pair.rb
  - [x] range_set.rb
- [ ] parser.rb
- [ ] parser_interpreter.rb
- [x] parser_rule_context.rb
- [x] proxy_error_listener.rb
- [x] recognizer.rb
- [x] rule_context.rb
- [x] ~~rule_context_with_alt_num.rb~~
- [x] runtime_meta_data.rb
- [x] token.rb
- [ ] ~~token_stream_rewriter.rb~~
- [ ] tree
  - [x] abstract_parse_tree_visitor.rb
  - [x] error_node.rb
  - [ ] ~~iterative_parse_tree_walker.rb~~
  - [ ] ~~parse_tree_property.rb~~
  - [x] parse_tree_walker.rb
  - [x] terminal_node.rb
  - [ ] trees.rb
- [ ] ~~unbuffered_char_stream.rb~~
- [ ] ~~unbuffered_token_stream.rb~~
- [x] version.rb
- [x] vocabulary.rb
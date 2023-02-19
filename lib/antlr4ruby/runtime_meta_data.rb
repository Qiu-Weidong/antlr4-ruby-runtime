# 已完成

module Antlr4ruby
  class RuntimeMetaData
    VERSION = "4.11.1"

    def self.get_runtime_version
      VERSION
    end

    def self.check_version(tool_version, compile_time_version)
      runtime_version = VERSION
      conflicts_with_tool = false
      conflicts_with_compile = false

      if tool_version
        conflicts_with_tool = !runtime_version.eql?(tool_version) &&
          !get_major_minor_version(runtime_version).eql?(get_major_minor_version(tool_version))
      end

      conflicts_with_compile =
        !runtime_version.eql?(compile_time_version) &&
          !get_major_minor_version(runtime_version).eql?(get_major_minor_version(compile_time_version))

      if conflicts_with_tool
        print "ANTLR Tool version #{tool_version} used for code generation does not match the current runtime version #{runtime_version}"
      end

      if conflicts_with_compile
        print "ANTLR Runtime version #{compile_time_version} used for parser compilation does not match the current runtime version #{runtime_version}"
      end
    end

    def self.get_major_minor_version(version)
      # 懒得解析了
      version
    end

  end
end
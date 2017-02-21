module Download
  class Base

    DOWNLOAD_DIR = File.dirname(File.expand_path(__FILE__))

    def initialize(bin_name)
      @config = JSON.parse(File.read("download/#{bin_name}.json"))
    end

    def install_or_update
      system("mkdir -p #{DOWNLOAD_DIR}/sources")
      print "checking #{bin_name}-#{version}... "
      install unless installed?
      update unless version_up_to_date?
      print "OK"
    end

    def install
      puts "installing #{bin_name}-#{version}"
      #system("wget #{sources_url} /sources/")
    end

    def update
    end

    def bin_name
      @_bin_name ||= @hash['bin_name']
    end

    def version
      @_version ||= @hash['version']
    end

    def sources_url
      @_sources_url ||= @hash['sources_url']
    end

    def tar_options
      @_tar_options ||= @hash['tar_options'] || 'xvf'
    end

    def version_regexp
      @_version_regexp ||= Regexp.new(@hash['version_regexp']) || /#{bin_name} (?<version>[0-9\.]+)/
    end

    def version_options
      @_version_option ||= @hash['version_option'] || '--version'
    end

    private

    def installed?
      system("command -v #{bin_name} >/dev/null")
    end

    def version_up_to_date?
      match = `#{bin_name} #{version_options}`.match(version_regexp)
      return match[:version] == version if match
      false
    end

  end
end

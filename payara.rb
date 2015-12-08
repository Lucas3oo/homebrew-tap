class Payara < Formula
  desc ""
  homepage ""
  url "https://s3-eu-west-1.amazonaws.com/payara.co/Payara+Downloads/Payara+4.1.1.154/payara-4.1.1.154.zip"
  version "4.1.1.154"
  sha256 "855e56475bfc7d98507f61e61fdb2e3e7c07527458154173796b99ebf39bcf37"

  bottle :unneeded

  depends_on :java

  def install
    # Remove windows files
    rm_rf Dir["bin/*.bat"]
    rm_rf Dir["glassfish/bin/*.bat"]
    libexec.install Dir["*", ".org.opensolaris,pkg"]
    Pathname.glob("#{libexec}/bin/*") do |file|
      next if file.directory?
      basename = file.basename
      (bin/basename).write_env_script file, Language::Java.overridable_java_home_env
    end
  end


  conflicts_with "glassfish", :because => "also installs a 'glassfish' executable"

end

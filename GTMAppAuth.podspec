Pod::Spec.new do |s|

  s.name         = "GTMAppAuth"
  s.version      = "0.7.1"
  s.summary      = "Authorize GTM Session Fetcher requests with AppAuth via GTMAppAuth"

  s.description  = <<-DESC

GTMAppAuth enables you to use AppAuth with the Google Toolbox for Mac - Session
Fetcher and Google APIs Client Library for Objective-C For REST libraries by
providing an implementation of GTMFetcherAuthorizationProtocol for authorizing
requests with AppAuth.

                   DESC

  # Note: While tvOS is specified here, only iOS and macOS have support for
  #       obtaining authorization from the user. You can use the classes of
  #       GTMAppAuth with tokens obtained out of band to authorize requests
  #       on tvOS.
  s.platforms    = { :ios => "7.0", :osx => "10.9", :tvos => "9.0" }

  s.homepage     = "https://github.com/google/GTMAppAuth"
  s.license      = "Apache License, Version 2.0"
  s.authors      = { "William Denniss" => "wdenniss@google.com",
                     "Zsika Phillip" => "zsika@google.com",
                   }

  s.source       = { :git => "https://github.com/google/GTMAppAuth.git", :tag => s.version }

  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |core|
    core.source_files = "Source/*.{h,m}"
    core.ios.source_files = "Source/GTMOAuth2KeychainCompatibility/*.{h,m}", "Source/iOS/**/*.{h,m}"
    core.osx.source_files = "Source/GTMOAuth2KeychainCompatibility/*.{h,m}", "Source/macOS/**/*.{h,m}"
    core.tvos.source_files = "Source/iOS/GTMKeychain_iOS.m"
    core.dependency 'GTMSessionFetcher', '~> 1.1'
    core.dependency 'AppAuth', '~> 0.95'
  end

  s.subspec "AppExtension" do |ext|
    ext.source_files = "Source/*.{h,m}"
    ext.ios.source_files = "Source/GTMOAuth2KeychainCompatibility/*.{h,m}", "Source/iOS/**/*.{h,m}"
    ext.osx.source_files = "Source/GTMOAuth2KeychainCompatibility/*.{h,m}", "Source/macOS/**/*.{h,m}"
    ext.tvos.source_files = "Source/iOS/GTMKeychain_iOS.m"
    ext.dependency 'GTMSessionFetcher', '~> 1.1'
    ext.dependency 'AppAuth/AppExtension', '~> 0.95'
  end


  s.ios.deployment_target = "7.0"
  s.ios.framework    = "SafariServices"

  s.osx.deployment_target = '10.9'

  s.tvos.deployment_target = '9.0'

  s.frameworks = 'Security', 'SystemConfiguration'
end

platform :ios, '10.0'
use_frameworks!

def rx_base
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'RxAlamofire'
end

def code
  pod 'SwiftLint'
end

def tests_networking
  pod 'OHHTTPStubs/Swift'
end

target 'GitHubSearchDemo' do
  code
  rx_base
end

target 'GitHubSearchDemoTests' do
  rx_base
  tests_networking
end



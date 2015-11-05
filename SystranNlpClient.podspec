#
# Be sure to run `pod lib lint SystranNlpClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "SystranNlpClient"
    s.version          = "1.0.0"

    s.summary          = "REST NLP API"
    s.description      = <<-DESC
                         ### Introduction\n\nREST API to use Natural Language Processing (NLP) features.\n\nThe NLP provides a modular approach to cover most language processing needs including: language identification, segmentation, tokenization, named-entity extraction, transcription...\n\n### Cross Domain\n\nNLP API supports cross-domain requests through the JSONP or the CORS mechanism.\n\nNLP API also supports the Silverlight client access policy file (clientaccesspolicy.xml) and the Adobe Flash cross-domain policy file (crossdomain.xml) that handles cross-domain requests.\n\n#### JSONP Support\n\nNLP API supports JSONP by providing the name of the callback function as a parameter. The response body will be contained in the parentheses:\n\n```javascript\ncallbackFunctionName(/* response body as defined in each API section */);\n```\n\nFor example for a supportedLanguages call with the callback set to supportedLanguagesCallback the response body will be similar to the following:\n\n```javascript\nsupportedLanguagesCallback({\n  \&quot;languages\&quot;: [\n     {\n         \&quot;lang\&quot;: \&quot;en\&quot;, /* language */\n         \&quot;model\&quot;: \&quot;eng\&quot;, /* model */\n     }\n  ]\n});\n```\n\n#### CORS\n\nNLP API supports the CORS mechanism to handle cross-domain requests. The server will correctly handle the OPTIONS requests used by CORS.\n\nThe following headers are set as follows:\n\n```\nAccess-Control-Allow-Origin: *\nAccess-Control-Allow-Headers: X-Requested-With,Content-Type,X-HTTP-METHOD-OVERRIDE\n```\n\n### Langage Code Values\n\nThe language codes to be used are the two-letter codes defined by the ISO 639-1:2002, Codes for the representation of names of languages - Part 1: Alpha-2 code standard.\n\nRefer to the column &#39;ISO 639-1 code&#39; of this list: http://www.loc.gov/standards/iso639-2/php/code_list.php.\n\nIn addition to this list, the following codes are used:\n\nLanguage Code |Language\n--------------|---------\ntj | Tajik (cyrillic script)\nzh-Hans | Chinese (Simplified)\nzh-Hant |Chinese (Traditional)
                         DESC

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.framework    = 'SystemConfiguration'
    s.source_files = 'SystranNlpClient/**/*'
    s.public_header_files = 'SystranNlpClient/**/*.h'

    s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'JSONModel', '~> 1.1'
    s.dependency 'ISO8601', '~> 0.3'
end


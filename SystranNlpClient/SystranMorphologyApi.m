#import "SystranMorphologyApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranMorphologyExtractLemmaResponse.h"
#import "SystranMorphologyExtractNPResponse.h"
#import "SystranMorphologyExtractPosResponse.h"
#import "SystranSupportedLanguagesResponse.h"


@interface SystranMorphologyApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranMorphologyApi

static SystranMorphologyApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SystranConfiguration *config = [SystranConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SystranApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SystranApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SystranMorphologyApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranMorphologyApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranMorphologyApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranMorphologyApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SystranApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Get lemma
/// Get the lemma for elements of an input text.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranMorphologyExtractLemmaResponse*
///
-(NSNumber*) nlpMorphologyExtractLemmaPostWithCompletionBlock: (NSString*) lang
         input: (NSString*) input
         inputFile: (NSURL*) inputFile
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranMorphologyExtractLemmaResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpMorphologyExtractLemmaPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/morphology/extract/lemma"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(input != nil) {
        
        queryParams[@"input"] = input;
    }
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded", @"*/*"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"inputFile"] = inputFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranMorphologyExtractLemmaResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranMorphologyExtractLemmaResponse*)data, error);
              }
          ];
}

///
/// Get NP/chunks
/// Get Noun-phrases and chunks from an input text.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranMorphologyExtractNPResponse*
///
-(NSNumber*) nlpMorphologyExtractNpPostWithCompletionBlock: (NSString*) lang
         input: (NSString*) input
         inputFile: (NSURL*) inputFile
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranMorphologyExtractNPResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpMorphologyExtractNpPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/morphology/extract/np"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(input != nil) {
        
        queryParams[@"input"] = input;
    }
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded", @"*/*"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"inputFile"] = inputFile;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranMorphologyExtractNPResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranMorphologyExtractNPResponse*)data, error);
              }
          ];
}

///
/// Get part of speech
/// Get the part of speech for elements of an input text.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranMorphologyExtractPosResponse*
///
-(NSNumber*) nlpMorphologyExtractPosPostWithCompletionBlock: (NSString*) lang
         input: (NSString*) input
         inputFile: (NSURL*) inputFile
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranMorphologyExtractPosResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpMorphologyExtractPosPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/morphology/extract/pos"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(input != nil) {
        
        queryParams[@"input"] = input;
    }
    if(lang != nil) {
        
        queryParams[@"lang"] = lang;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[@"multipart/form-data", @"application/x-www-form-urlencoded", @"*/*"]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    if(inputFile != nil) {
        
    files[@"inputFile"] = inputFile;
    }
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranMorphologyExtractPosResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranMorphologyExtractPosResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of languages pairs in which Morphological analysis is supported.
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSupportedLanguagesResponse*
///
-(NSNumber*) nlpMorphologySupportedLanguagesGetWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/morphology/supportedLanguages"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SystranApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[@"accessToken", @"apiKey"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"SystranSupportedLanguagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSupportedLanguagesResponse*)data, error);
              }
          ];
}



@end

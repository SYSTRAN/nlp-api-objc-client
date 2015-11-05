#import "SystranSegmentationApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranSegmentationSegmentResponse.h"
#import "SystranSegmentationSegmentAndTokenizeResponse.h"
#import "SystranSupportedLanguagesResponse.h"
#import "SystranSegmentationTokenizeResponse.h"


@interface SystranSegmentationApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranSegmentationApi

static SystranSegmentationApi* singletonAPI = nil;

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

+(SystranSegmentationApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranSegmentationApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranSegmentationApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranSegmentationApi alloc] init];
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
/// Segment
/// Segment an input text.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSegmentationSegmentResponse*
///
-(NSNumber*) nlpSegmentationSegmentPostWithCompletionBlock: (NSString*) lang
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSegmentationSegmentResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpSegmentationSegmentPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/segmentation/segment"];

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
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
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
                                         responseType: @"SystranSegmentationSegmentResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSegmentationSegmentResponse*)data, error);
              }
          ];
}

///
/// Segment and tokenize
/// Segment an input text, then tokenize each segment.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSegmentationSegmentAndTokenizeResponse*
///
-(NSNumber*) nlpSegmentationSegmentAndTokenizePostWithCompletionBlock: (NSString*) lang
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSegmentationSegmentAndTokenizeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpSegmentationSegmentAndTokenizePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/segmentation/segmentAndTokenize"];

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
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
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
                                         responseType: @"SystranSegmentationSegmentAndTokenizeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSegmentationSegmentAndTokenizeResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of languages in which Segmentation is supported.
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSupportedLanguagesResponse*
///
-(NSNumber*) nlpSegmentationSupportedLanguagesGetWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/segmentation/supportedLanguages"];

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

///
/// Tokenize
/// Tokenize an input text.
///  @param lang Language code of the input ([details](#description_langage_code_values))
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSegmentationTokenizeResponse*
///
-(NSNumber*) nlpSegmentationTokenizePostWithCompletionBlock: (NSString*) lang
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranSegmentationTokenizeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpSegmentationTokenizePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/segmentation/tokenize"];

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
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"application/json"]];
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
                                         responseType: @"SystranSegmentationTokenizeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranSegmentationTokenizeResponse*)data, error);
              }
          ];
}



@end

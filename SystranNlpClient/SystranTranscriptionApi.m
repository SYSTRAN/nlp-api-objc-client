#import "SystranTranscriptionApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranTranscriptionSupportedLanguagesResponse.h"


@interface SystranTranscriptionApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranTranscriptionApi

static SystranTranscriptionApi* singletonAPI = nil;

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

+(SystranTranscriptionApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranTranscriptionApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranTranscriptionApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranTranscriptionApi alloc] init];
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
/// Supported Languages
/// List of languages pairs in which Transcription is supported. This list can be limited to a specific source language or target language.
///  @param source Source Language code ([details](#description_langage_code_values))
///
///  @param target Target Language code ([details](#description_langage_code_values))
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranTranscriptionSupportedLanguagesResponse*
///
-(NSNumber*) nlpTranscriptionSupportedLanguagesGetWithCompletionBlock: (NSString*) source
         target: (NSString*) target
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranTranscriptionSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/transcription/supportedLanguages"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(source != nil) {
        
        queryParams[@"source"] = source;
    }
    if(target != nil) {
        
        queryParams[@"target"] = target;
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
                                         responseType: @"SystranTranscriptionSupportedLanguagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranTranscriptionSupportedLanguagesResponse*)data, error);
              }
          ];
}

///
/// Transcribe
/// Transcribe text from a source language to a target language.
///  @param source Source Language code ([details](#description_langage_code_values))
///
///  @param target Target Language code ([details](#description_langage_code_values))
///
///  @param inputFile input text\n\n**Either `input` or `inputFile` is required**
///
///  @param input input text\n\n**Either `input` or `inputFile` is required**
///
///  @param profile Profile id
///
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns NSURL*
///
-(NSNumber*) nlpTranscriptionTranscribePostWithCompletionBlock: (NSString*) source
         target: (NSString*) target
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(NSURL* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'source' is set
    if (source == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `source` when calling `nlpTranscriptionTranscribePost`"];
    }
    
    // verify the required parameter 'target' is set
    if (target == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `target` when calling `nlpTranscriptionTranscribePost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/transcription/transcribe"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(input != nil) {
        
        queryParams[@"input"] = input;
    }
    if(source != nil) {
        
        queryParams[@"source"] = source;
    }
    if(target != nil) {
        
        queryParams[@"target"] = target;
    }
    if(profile != nil) {
        
        queryParams[@"profile"] = profile;
    }
    if(callback != nil) {
        
        queryParams[@"callback"] = callback;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SystranApiClient selectHeaderAccept:@[@"text/plain"]];
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
                                         responseType: @"NSURL*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((NSURL*)data, error);
              }
          ];
}



@end

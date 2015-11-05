#import "SystranNerApi.h"
#import "SystranQueryParamCollection.h"
#import "SystranNerExtractAnnotationsResponse.h"
#import "SystranNerExtractEntitiesResponse.h"
#import "SystranSupportedLanguagesResponse.h"


@interface SystranNerApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SystranNerApi

static SystranNerApi* singletonAPI = nil;

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

+(SystranNerApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranNerApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SystranNerApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SystranNerApi alloc] init];
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
/// Get entity annotations
/// Get the list of entity annotations given an input text.\nAn entity annotation is an entity associated with its position in the text.
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
///  @returns SystranNerExtractAnnotationsResponse*
///
-(NSNumber*) nlpNerExtractAnnotationsPostWithCompletionBlock: (NSString*) lang
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranNerExtractAnnotationsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpNerExtractAnnotationsPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/ner/extract/annotations"];

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
                                         responseType: @"SystranNerExtractAnnotationsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranNerExtractAnnotationsResponse*)data, error);
              }
          ];
}

///
/// Get list of entities
/// Get the list of different entities given an input text.
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
///  @returns SystranNerExtractEntitiesResponse*
///
-(NSNumber*) nlpNerExtractEntitiesPostWithCompletionBlock: (NSString*) lang
         inputFile: (NSURL*) inputFile
         input: (NSString*) input
         profile: (NSNumber*) profile
         callback: (NSString*) callback
        
        completionHandler: (void (^)(SystranNerExtractEntitiesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'lang' is set
    if (lang == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `lang` when calling `nlpNerExtractEntitiesPost`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/ner/extract/entities"];

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
                                         responseType: @"SystranNerExtractEntitiesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((SystranNerExtractEntitiesResponse*)data, error);
              }
          ];
}

///
/// Supported Languages
/// List of languages in which NER is supported.
///  @param callback Javascript callback function name for JSONP Support
///
///  @returns SystranSupportedLanguagesResponse*
///
-(NSNumber*) nlpNerSupportedLanguagesGetWithCompletionBlock: (NSString*) callback
        
        completionHandler: (void (^)(SystranSupportedLanguagesResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/nlp/ner/supportedLanguages"];

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

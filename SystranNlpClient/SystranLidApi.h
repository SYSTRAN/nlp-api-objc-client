#import <Foundation/Foundation.h>
#import "SystranLidDocumentResponse.h"
#import "SystranLidParagraphResponse.h"
#import "SystranObject.h"
#import "SystranApiClient.h"


/**
 * NOTE: This class is auto generated by the swagger code generator program. 
 * https://github.com/swagger-api/swagger-codegen 
 * Do not edit the class manually.
 */

@interface SystranLidApi: NSObject

@property(nonatomic, assign)SystranApiClient *apiClient;

-(instancetype) initWithApiClient:(SystranApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SystranLidApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(SystranLidApi*) sharedAPI;
///
///
/// Document language detection
/// Global language detection on document.
///
/// @param inputFile input text\n\n**Either `input` or `inputFile` is required**
/// @param input input text\n\n**Either `input` or `inputFile` is required**
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranLidDocumentResponse*
-(NSNumber*) nlpLidDetectLanguageDocumentPostWithCompletionBlock :(NSURL*) inputFile 
     input:(NSString*) input 
     callback:(NSString*) callback 
    
    completionHandler: (void (^)(SystranLidDocumentResponse* output, NSError* error))completionBlock;
    


///
///
/// Paragraph language detection
/// Language detection for each paragraph in a document.
///
/// @param inputFile input text\n\n**Either `input` or `inputFile` is required**
/// @param input input text\n\n**Either `input` or `inputFile` is required**
/// @param callback Javascript callback function name for JSONP Support
/// 
///
/// @return SystranLidParagraphResponse*
-(NSNumber*) nlpLidDetectLanguageParagraphPostWithCompletionBlock :(NSURL*) inputFile 
     input:(NSString*) input 
     callback:(NSString*) callback 
    
    completionHandler: (void (^)(SystranLidParagraphResponse* output, NSError* error))completionBlock;
    



@end

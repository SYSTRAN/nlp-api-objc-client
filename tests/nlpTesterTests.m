#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SystranApiClient.h"
#import "SystranConfiguration.h"
#import "SystranLidApi.h"
#import "SystranMorphologyApi.h"
#import "SystranNerApi.h"
#import "SystranTranscriptionApi.h"
#import "SystranSegmentationApi.h"

@interface NlpTesterTests : XCTestCase {
    NSString *key;
    SystranConfiguration *configuration;
    SystranTranscriptionApi *transcriptionApi;
    SystranMorphologyApi *morphologyApi;
    SystranNerApi *nerApi;
    SystranLidApi *lidApi;
    SystranSegmentationApi *segmentationApi;
    NSString* sample;
    NSData* data;
    NSURL *file;
}
@end
@implementation NlpTesterTests

- (void)setUp {
    NSString *path = @"<API_KEY_FILE_PATH_HERE>";
    key = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [[SystranConfiguration sharedConfig] setApiKey: key forApiKeyIdentifier:@"key"];
    [[SystranConfiguration sharedConfig] setHost:@"https://platform.systran.net:8904"];
    
    lidApi = [[SystranLidApi alloc]init];
    morphologyApi = [[SystranMorphologyApi alloc]init];
    nerApi = [[SystranNerApi alloc]init];
    transcriptionApi = [[SystranTranscriptionApi alloc]init];
    segmentationApi = [[SystranSegmentationApi alloc]init];
    
    sample = @"The quick brown fox jumps over the lazy dog";
    data = [sample dataUsingEncoding:NSUTF8StringEncoding];
    path = @"<TEXT_FILE_PATH_HERE>";
    file = [[NSURL alloc] initFileURLWithPath:path];
    
}


- (void)testDetectLanguageDocumentFromInput {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"DetectLanguageDocument"];
    [lidApi nlpLidDetectLanguageDocumentPostWithCompletionBlock:nil input:@"this is a test" callback: nil completionHandler:^(SystranLidDocumentResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to detect languages in document");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}


- (void)testDetectLanguageDocumentFromParagraphInput {
    XCTestExpectation *expectation = [self expectationWithDescription:@"DetectLanguageParagraph"];
    
    [lidApi nlpLidDetectLanguageParagraphPostWithCompletionBlock:nil input:@"this is a test" callback: nil completionHandler:^(SystranLidParagraphResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to detect languages in paragraph");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testMorphologySupportedLanguages {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"MorphologySupportedLanguages"];
    [morphologyApi nlpMorphologySupportedLanguagesGetWithCompletionBlock:nil completionHandler:^(SystranSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch supported languages");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testMorphologyExtractPos {
    XCTestExpectation *expectation = [self expectationWithDescription:@"MorphologyExtractPos"];
    
    [morphologyApi nlpMorphologyExtractPosPostWithCompletionBlock:@"en" input:@"this is a test" inputFile:nil  profile:nil callback:nil completionHandler:^(NSString *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to extract position");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testMorphologyExtractNp {
    XCTestExpectation *expectation = [self expectationWithDescription:@"MorphologyExtractNp"];
    [morphologyApi nlpMorphologyExtractNpPostWithCompletionBlock:@"en" input:nil inputFile:file  profile:nil callback:nil completionHandler:^(SystranMorphologyExtractNPResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to extract");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}
- (void)testMorphologyExtractLemma {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"MorphologyExtractLemma"];
    [morphologyApi nlpMorphologyExtractLemmaPostWithCompletionBlock:@"en" input:nil inputFile:file  profile:nil callback:nil completionHandler:^(SystranMorphologyExtractLemmaResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testNerSupportedLanguages {
    XCTestExpectation *expectation = [self expectationWithDescription:@"NerSupportedLanguages"];
    [nerApi nlpNerSupportedLanguagesGetWithCompletionBlock:nil completionHandler:^(SystranSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testNerExtractAnnotations {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"NerExtractAnnotations"];
    
    [nerApi nlpNerExtractAnnotationsPostWithCompletionBlock:@"en" inputFile:file input:nil  profile:nil callback:nil completionHandler:^(SystranNerExtractAnnotationsResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testNerExtractEntities {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"NerExtractEntities"];
    [nerApi nlpNerExtractEntitiesPostWithCompletionBlock:@"en" inputFile:file input:nil  profile:nil  callback:nil completionHandler:^(SystranNerExtractEntitiesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}


//!
- (void)testTranscriptionSupportedLanguages {
    XCTestExpectation *expectation = [self expectationWithDescription:@"TranscriptionSupportedLanguages"];
    [transcriptionApi nlpTranscriptionSupportedLanguagesGetWithCompletionBlock:nil target:nil callback:nil completionHandler:^(SystranTranscriptionSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)testTranscriptionTranscribe {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"TranscriptionTranscribe"];
    
    [transcriptionApi nlpTranscriptionTranscribePostWithCompletionBlock:@"en" target:@"ru" inputFile:file input:nil profile:nil callback:nil completionHandler:^(NSURL *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSegmentationSupportedLanguages {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"SegmentationSupportedLanguages"];
    [segmentationApi nlpSegmentationSupportedLanguagesGetWithCompletionBlock:nil completionHandler:^(SystranSupportedLanguagesResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)testSegmentationTokenizeGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"SegmentationTokenizeGet"];
    
    [segmentationApi nlpSegmentationTokenizePostWithCompletionBlock:@"en" inputFile:file input:nil profile:nil callback:nil completionHandler:^(SystranSegmentationTokenizeResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSegmentationSegmentAndTokenizeGet {
    XCTestExpectation *expectation = [self expectationWithDescription:@"SegmentationSegmentAndTokenizeGet"];
    [segmentationApi nlpSegmentationSegmentAndTokenizePostWithCompletionBlock:@"en" inputFile:file input:nil  profile:nil callback:nil completionHandler:^(SystranSegmentationSegmentAndTokenizeResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            NSLog(@"%@",output);
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:20.0 handler:nil];
}

- (void)testSegmentationSegmentGet {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"SegmentationSegmentGet"];
    [segmentationApi nlpSegmentationSegmentPostWithCompletionBlock:@"en" inputFile:file input:nil  profile:nil callback:nil completionHandler:^(SystranSegmentationSegmentResponse *output, NSError *error) {
        if(error) {
            XCTFail(@"got error %@", error);
        }
        if(output == nil){
            XCTFail(@"failed to fetch file formats");
        }
        else {
            XCTAssertNotNil(output, @"Pass");
            [expectation fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

@end

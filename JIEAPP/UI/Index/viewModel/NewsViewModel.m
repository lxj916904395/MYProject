//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "NewsViewModel.h"

#import "NewsItem.h"

@interface NewsViewModel ()

@property(assign, nonatomic) BOOL isFirst;

@end

@implementation NewsViewModel

- (instancetype)initWithCid:(NSString *)cid {
    if (self = [super init]) {
        self.cid = cid;
        [self iniViewModel];
    }
    return self;
}

- (NSMutableArray *)datas {
    lazyMutableArray(_datas);
}

- (void)iniViewModel {

    @weakify(self);
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {

        @strongify(self);
        self.dataType = [input integerValue];

        return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {

            [self loadData:^(NSMutableArray *array) {

                if (self.dataType == NewsDataTypeNew) {
                    [array addObjectsFromArray:self.datas];
                    [self.datas removeAllObjects];
                }
                [self.datas addObjectsFromArray:array];

                [subscriber sendNext:self.datas];
                [subscriber sendCompleted];

            }        error:^() {
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];

}

- (void)loadData:(void (^)(NSMutableArray *array))successBlock error:(void (^)(void))errorBlock {

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cid"] = self.cid;
    params[@"method"] = self.dataType == NewsDataTypeNew ? @"NEW" : @"HIS";

    if (!self.isFirst) {
        self.isFirst = !self.isFirst;
        params[@"isFirstDown"] = @"YES";
    }


    if (self.datas.count > 0) {
        NewsInfo *last = [self.datas lastObject];
        params[@"last_pid"] = last.pid;
        params[@"local_cache"] = @"1";
    } else {
        params[@"local_cache"] = @"0";
    }

    [HttpManager newsArticles:params success:^(HttpRespondse *response) {

        if (responseSuccess(response)) {

            NSArray *items = response.data[@"items"];
            NSDictionary *articles = response.data[@"articles"];

            NSMutableArray *news = [NSMutableArray array];
            for (NSDictionary *itemDictionary in items) {

                NewsItem *item = [[NewsItem alloc] init];
                [item setValuesForKeysWithDictionary:itemDictionary];

                NSDictionary *dictionary = articles[item.key];
                if (dictionary == nil)continue;

                NewsInfo *newsInfo = [[NewsInfo alloc] init];
                [newsInfo setValuesForKeysWithDictionary:dictionary];
                [news addObject:newsInfo];
            }

            successBlock(news);
            
            [NewsInfo save:news cid:self.cid];
        } else {
            errorBlock();
        }

    } error:^(NSError *error) {
        errorBlock();
    }];
}


@end

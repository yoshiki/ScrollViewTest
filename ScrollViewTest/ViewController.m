#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];

    self.scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){ 0.0f, 100.0f, 300.0f, 100.0f }];
    self.scrollView.clipsToBounds = NO;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
//    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.bounds = (CGRect){ 0.0f, 0.0f, 300.0f, 100.0f };
    self.scrollView.contentSize = (CGSize){ 880.0f, 100.0f };
    
    NSArray *colors = @[
                        [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5],
                        [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5],
                        [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5],
                        ];

    for (int i = 0; i < 3; i++) {
        UIView *v = [[UIView alloc] initWithFrame:(CGRect){ i * 300.0f, 0.0f, 300.0f, 100.0f }];
        v.backgroundColor = colors[i];
        [self.scrollView addSubview:v];
    }
}

@end

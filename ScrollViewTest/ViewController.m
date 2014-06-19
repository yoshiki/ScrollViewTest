#import "ViewController.h"

static int const pageNum = 3;
static int const itemNum = 3;
static CGFloat const itemWidth = 88.0f;
static CGFloat const itemHeight = 140.0f;
static CGFloat const marginEdge = 12.0f;
//static CGFloat const itemWidth = 136.0f;
//static CGFloat const itemHeight = 200.0f;
//static CGFloat const marginEdge = 12.0f;
//static CGFloat const marginMiddle = 12.0f;
static CGFloat const pageWidth = (marginEdge + itemWidth) * itemNum;

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];

    self.scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){ 0.0f, 100.0f, pageWidth, itemHeight }];
    self.scrollView.clipsToBounds = NO;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize = (CGSize){ pageWidth * pageNum - marginEdge, itemHeight };
    
    for (int i = 0; i < pageNum; i++) {
        UIView *v = [self pageWithFrame:(CGRect){ i * pageWidth, 0.0f, pageWidth, itemHeight }
                                  color:[UIColor clearColor]];
        [self.scrollView addSubview:v];
    }
}

- (UIView *)pageWithFrame:(CGRect)frame color:(UIColor *)color
{
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = color;
    
    for (int i = 0; i < itemNum; i++) {
        UIView *itemView = [[UIView alloc] initWithFrame:(CGRect){
            marginEdge + (i * (marginEdge + itemWidth)),
            0.0f,
            itemWidth,
            itemHeight,
        }];
        itemView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
        [v addSubview:itemView];
    }
    return v;
}

- (UIColor *)randomizedColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:0.3f];
}

@end

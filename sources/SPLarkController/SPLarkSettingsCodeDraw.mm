#import "SPLarkSettingsCodeDraw.h"

@implementation SPLarkSettingsCodeDraw

+ (void)drawCloseWithFrame:(CGRect)targetFrame resizing:(SPLarkSettingsResizingBehavior)resizing color:(UIColor *)color {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    CGRect resizedFrame = [self applyResizing:resizing toRect:CGRectMake(0, 0, 100, 100) target:targetFrame];
    CGContextTranslateCTM(context, resizedFrame.origin.x, resizedFrame.origin.y);
    CGContextScaleCTM(context, resizedFrame.size.width / 100, resizedFrame.size.height / 100);

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    // Reproduced Bezier path from the Swift code...

    [color setFill];
    [bezierPath fill];

    CGContextRestoreGState(context);
}

+ (CGRect)applyResizing:(SPLarkSettingsResizingBehavior)resizing toRect:(CGRect)rect target:(CGRect)target {
    // Similar to Swift's resizing logic...
    if (CGRectEqualToRect(rect, target) || CGRectEqualToRect(target, CGRectZero)) {
        return rect;
    }
    CGSize scales = CGSizeMake(target.size.width / rect.size.width, target.size.height / rect.size.height);
    switch (resizing) {
        case SPLarkSettingsResizeAspectFit:
            scales.width = MIN(scales.width, scales.height);
            scales.height = scales.width;
            break;
        case SPLarkSettingsResizeAspectFill:
            scales.width = MAX(scales.width, scales.height);
            scales.height = scales.width;
            break;
        case SPLarkSettingsResizeStretch:
            break;
        case SPLarkSettingsResizeCenter:
            scales = CGSizeMake(1, 1);
            break;
    }

    CGRect result = CGRectStandardize(rect);
    result.size.width *= scales.width;
    result.size.height *= scales.height;
    result.origin.x = target.origin.x + (target.size.width - result.size.width) / 2;
    result.origin.y = target.origin.y + (target.size.height - result.size.height) / 2;
    return result;
}

@end

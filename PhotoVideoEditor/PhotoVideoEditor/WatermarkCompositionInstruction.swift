//
//  WatermarkCompositionInstruction.swift
//  CustomVideoCompositor
//
//  Created by Clay Garrett on 11/16/16.
//  Copyright © 2016 Clay Garrett. All rights reserved.
//

import UIKit
import AVFoundation
class WatermarkCompositionInstruction: NSObject, AVVideoCompositionInstructionProtocol {
    
    // AVVideoCompositionInstructionProtocol allows you to pass along any type of instruction that the compositor might need to
    // correctly render frames for a given time range. in our case, we need a watermark image and a transform
    // but any type of property could go here and then be drawn in your custom compositor
    
    var watermarkImage: CGImage?
    var watermarkFrame: CGRect?
    
    /// The following 5 items are required for the protocol
    /// See information on them here:
    /// https://developer.apple.com/reference/avfoundation/avvideocompositioninstructionprotocol
    /// set the correct values for your specific use case
    
    /* Indicates the timeRange during which the instruction is effective. Note requirements for the timeRanges of instructions described in connection with AVVideoComposition's instructions key above. */
    var timeRange: CMTimeRange
    
    /* If NO, indicates that post-processing should be skipped for the duration of this instruction.
     See +[AVVideoCompositionCoreAnimationTool videoCompositionToolWithPostProcessingAsVideoLayer:inLayer:].*/
    var enablePostProcessing: Bool = true
    
    /* If YES, rendering a frame from the same source buffers and the same composition instruction at 2 different
     compositionTime may yield different output frames. If NO, 2 such compositions would yield the
     same frame. The media pipeline may me able to avoid some duplicate processing when containsTweening is NO */
    var containsTweening: Bool = true
    
    /* List of video track IDs required to compose frames for this instruction. If the value of this property is nil, all source tracks will be considered required for composition */
    var requiredSourceTrackIDs: [NSValue]?
    
    /* If for the duration of the instruction, the video composition result is one of the source frames, this property should
     return the corresponding track ID. The compositor won't be run for the duration of the instruction and the proper source
     frame will be used instead. The dimensions, clean aperture and pixel aspect ratio of the source buffer will be
     matched to the required values automatically */
    var passthroughTrackID: CMPersistentTrackID = kCMPersistentTrackID_Invalid // if not a passthrough instruction
    
    init(timeRange: CMTimeRange, watermarkImage: CGImage, watermarkFrame: CGRect) {
        self.watermarkImage = watermarkImage
        self.watermarkFrame = watermarkFrame
        self.timeRange = timeRange
    }
}

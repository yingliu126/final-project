{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "DepthMapFilter": "3.0",
            "CameraInit": "9.0",
            "DepthMap": "4.0",
            "PrepareDenseScene": "3.0",
            "Texturing": "6.0",
            "ImageMatching": "2.0",
            "StructureFromMotion": "3.1",
            "MeshFiltering": "3.0",
            "ImageMasking": "3.0",
            "FeatureExtraction": "1.2",
            "FeatureMatching": "2.0",
            "Meshing": "7.0"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "a058a863e8635ff1c689cd66e8e779f234859ba1"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": false,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "cb1d20d2fe8c94e2dc8740f09090fd63374ca2d7"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 10,
                "size": 16,
                "split": 2
            },
            "uids": {
                "0": "05900d1a866ad6b63142728233d2ec2f5f5aaa87"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "ccd489167542055a24fa91d4584645e035f10a8c"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "eb9689f7fd64a66a39a3ab32a9f60b2690eb392d"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "{ImageMasking_1.output}",
                "describerTypes": [
                    "sift",
                    "akaze",
                    "akaze_mldb",
                    "akaze_liop",
                    "akaze_ocv"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "3b552fe6e4a8b9636086b6211959e83fc72eb4ab"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "1b43804d834625feaa406ce43a54e4b9b974da53"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [
                    "{ImageMasking_1.output}"
                ],
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "33d5d03b4d4f3ec2a86ff1ca847331089977190d"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 233741495,
                        "poseId": 233741495,
                        "path": "D:/ly/stage3/gun6/output png/output_0021.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 233964602,
                        "poseId": 233964602,
                        "path": "D:/ly/stage3/gun6/output png/output_0020.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 244731128,
                        "poseId": 244731128,
                        "path": "D:/ly/stage3/gun6/output png/output_0069.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 254207742,
                        "poseId": 254207742,
                        "path": "D:/ly/stage3/gun6/output png/output_0068.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 255543530,
                        "poseId": 255543530,
                        "path": "D:/ly/stage3/gun6/output png/output_0022.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 258058416,
                        "poseId": 258058416,
                        "path": "D:/ly/stage3/gun6/output png/output_0024.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 263560069,
                        "poseId": 263560069,
                        "path": "D:/ly/stage3/gun6/output png/output_0067.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 265346352,
                        "poseId": 265346352,
                        "path": "D:/ly/stage3/gun6/output png/output_0023.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 351783930,
                        "poseId": 351783930,
                        "path": "D:/ly/stage3/gun6/output png/output_0027.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1075640097,
                        "poseId": 1075640097,
                        "path": "D:/ly/stage3/gun6/output png/output_0072.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1102383374,
                        "poseId": 1102383374,
                        "path": "D:/ly/stage3/gun6/output png/output_0071.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1536365512,
                        "poseId": 1536365512,
                        "path": "D:/ly/stage3/gun6/output png/output_0070.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2049806521,
                        "poseId": 2049806521,
                        "path": "D:/ly/stage3/gun6/output png/output_0095.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2059715828,
                        "poseId": 2059715828,
                        "path": "D:/ly/stage3/gun6/output png/output_0096.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2073335450,
                        "poseId": 2073335450,
                        "path": "D:/ly/stage3/gun6/output png/output_0097.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 2079101006,
                        "poseId": 2079101006,
                        "path": "D:/ly/stage3/gun6/output png/output_0098.png",
                        "intrinsicId": 1607810248,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1607810248,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "D:/ly/stage3/gun6/output png",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 3,
                "size": 16,
                "split": 6
            },
            "uids": {
                "0": "f7cb3aac2920be16a45ff8f75f440fb4d080ef22"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "6f1137282f22b7b6d0639364a70f4f8495735fbd"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "7140a24c8cba01a13f6164a3fc049d9a95070ea4"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "ImageMasking_1": {
            "nodeType": "ImageMasking",
            "position": [
                93,
                140
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 16,
                "split": 1
            },
            "uids": {
                "0": "73fedfeecd8502bd10a9f95497180cd682c9e410"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "algorithm": "AutoGrayscaleThreshold",
                "hsv": {
                    "hsvHue": 0.33,
                    "hsvHueRange": 0.1,
                    "hsvMinSaturation": 0.3,
                    "hsvMaxSaturation": 1.0,
                    "hsvMinValue": 0.3,
                    "hsvMaxValue": 1.0
                },
                "invert": true,
                "growRadius": 0,
                "shrinkRadius": 0,
                "depthMapFolder": "",
                "depthMapExp": "",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}
{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "PrepareDenseScene": "3.0",
            "FeatureExtraction": "1.2",
            "MeshFiltering": "3.0",
            "ImageMatching": "2.0",
            "ImageMasking": "3.0",
            "Meshing": "7.0",
            "DepthMapFilter": "3.0",
            "Texturing": "6.0",
            "CameraInit": "9.0",
            "DepthMap": "4.0",
            "FeatureMatching": "2.0",
            "StructureFromMotion": "3.1"
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
                "0": "67f9b6b4dc3f4becd13b192c4ad660f20b2e2151"
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
                "0": "1bf00672b2b41cb62a17f3ad1ca8f21cc07d78d5"
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
                "size": 30,
                "split": 3
            },
            "uids": {
                "0": "3980743cc984ba59fddc701a7f984ebc9996de13"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "78d01e21014e7b0e9829b2f426a3784687320d69"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "29f29ac64be8ceb69656908712a202ded0288d07"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "79011b7cec06264f92542bd15c105ccd808c6160"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "719beb7823b1e799bac3a337d2042420500c1de9"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "e365fb68369ace927a15c58f0e5a1325bf3c3682"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 11070430,
                        "poseId": 11070430,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0049.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:19\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 50451217,
                        "poseId": 50451217,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0009.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:16\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 87202296,
                        "poseId": 87202296,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0048.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:17\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 156551265,
                        "poseId": 156551265,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0008.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:14\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 476026983,
                        "poseId": 476026983,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0076.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:36\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 537131631,
                        "poseId": 537131631,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0081.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:44\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 538651059,
                        "poseId": 538651059,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0007.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:13\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 541169990,
                        "poseId": 541169990,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0068.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:25\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 582208711,
                        "poseId": 582208711,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0080.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:42\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 654570750,
                        "poseId": 654570750,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0006.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:11\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 660775163,
                        "poseId": 660775163,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0077.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:37\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 668657917,
                        "poseId": 668657917,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0069.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:27\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 671155301,
                        "poseId": 671155301,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0082.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:45\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 692750152,
                        "poseId": 692750152,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0004.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:08\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 729960589,
                        "poseId": 729960589,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0005.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:10\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 861628976,
                        "poseId": 861628976,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0083.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:47\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 959300270,
                        "poseId": 959300270,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0051.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:22\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1007112541,
                        "poseId": 1007112541,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0079.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:41\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1064884163,
                        "poseId": 1064884163,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0084.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:49\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1082203156,
                        "poseId": 1082203156,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0052.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:23\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1186717458,
                        "poseId": 1186717458,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0001.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:04\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1201335794,
                        "poseId": 1201335794,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0078.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:39\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1366228524,
                        "poseId": 1366228524,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0050.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:20\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1535718831,
                        "poseId": 1535718831,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0002.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:05\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1627526130,
                        "poseId": 1627526130,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0073.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:31\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1755745702,
                        "poseId": 1755745702,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0074.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:33\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1951454297,
                        "poseId": 1951454297,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0003.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:07\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1988401572,
                        "poseId": 1988401572,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0075.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:34\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2055693949,
                        "poseId": 2055693949,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0072.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:30\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2094645440,
                        "poseId": 2094645440,
                        "path": "D:/ly/stage3/gun6/reflection removal face 2/processed_output_0071.png",
                        "intrinsicId": 806025607,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:57:28\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 806025607,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "D:/ly/stage3/gun6/reflection removal face 2",
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
                "size": 30,
                "split": 10
            },
            "uids": {
                "0": "a604fd1619534b7315ac8c22e1f7a17beb916d8d"
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
                "0": "18dc2dfa69691313e1f974b7db9455de2d027b23"
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
                "size": 30,
                "split": 2
            },
            "uids": {
                "0": "22353fa752bf0fa3045faabbf6a2d8e3c6b2ba32"
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
                "size": 30,
                "split": 1
            },
            "uids": {
                "0": "af2d10d67f1e735fd0d97071a4fcc9b2eed0b758"
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
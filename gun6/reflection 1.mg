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
                "0": "f8609d68c9d8116c1dc3a219d8fe51188786865c"
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
                "0": "d73d6a43c762e72e190c0bed48b64680536cbf1d"
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
                "size": 28,
                "split": 3
            },
            "uids": {
                "0": "f7029fa86414907b9ab2bb737019326fe590ecf6"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "094885d3d6286141b5a605a40e76a3c546880a22"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "80ef6af9a64dfa9ff0cbe7aca1e0617aa8efecc0"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "922b2dc1204cb0943af798626681cbf0b8ff6a0d"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "a07797108ca3938edea66041e7ce350b99f4e8cb"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "9368fa79493ab4c006039fb3f31d482544942f8e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 6140901,
                        "poseId": 6140901,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0102.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 72509528,
                        "poseId": 72509528,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0071.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 147343044,
                        "poseId": 147343044,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0090.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 289114470,
                        "poseId": 289114470,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0094.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:45\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 338048476,
                        "poseId": 338048476,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0091.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:40\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 353579388,
                        "poseId": 353579388,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0099.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 542713215,
                        "poseId": 542713215,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0092.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:42\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 593384489,
                        "poseId": 593384489,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0093.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:43\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 787740313,
                        "poseId": 787740313,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0101.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 797121291,
                        "poseId": 797121291,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0070.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:33\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 929505513,
                        "poseId": 929505513,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0097.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:49\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 933199322,
                        "poseId": 933199322,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0027.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:26\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 958636125,
                        "poseId": 958636125,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0095.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:46\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1026301549,
                        "poseId": 1026301549,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0066.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:27\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1033260622,
                        "poseId": 1033260622,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0096.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:48\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1126919596,
                        "poseId": 1126919596,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0025.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:23\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1344241021,
                        "poseId": 1344241021,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0024.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:21\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1364381045,
                        "poseId": 1364381045,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0068.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:30\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1451776107,
                        "poseId": 1451776107,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0022.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:18\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1462428219,
                        "poseId": 1462428219,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0100.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1541800958,
                        "poseId": 1541800958,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0026.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:24\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1638045724,
                        "poseId": 1638045724,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0098.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:51\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1708945019,
                        "poseId": 1708945019,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0020.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:14\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1759864264,
                        "poseId": 1759864264,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0067.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:29\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1766765316,
                        "poseId": 1766765316,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/output_0072.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1824770820,
                        "poseId": 1824770820,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0069.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:32\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1933545741,
                        "poseId": 1933545741,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0023.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:19\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2101820863,
                        "poseId": 2101820863,
                        "path": "D:/ly/stage3/gun6/reflection removal face 1/processed_output_0021.png",
                        "intrinsicId": 67510616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"DateTime\": \"2024:12:02 15:47:16\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 67510616,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "D:/ly/stage3/gun6/reflection removal face 1",
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
                "size": 28,
                "split": 10
            },
            "uids": {
                "0": "bbbce8473bf88031d706debb7f454c9fe423c1f7"
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
                "0": "d350c195b539c113d0a9d04854801f071208acf5"
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
                "size": 28,
                "split": 2
            },
            "uids": {
                "0": "c184a4841fcc5624ee9d82286af7c2a2efde8389"
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
                "size": 28,
                "split": 1
            },
            "uids": {
                "0": "4a4d354fc5a61f4a6db50d44d239d8a60d33135c"
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
{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "CameraInit": "9.0",
            "DepthMapFilter": "3.0",
            "MeshFiltering": "3.0",
            "Meshing": "7.0",
            "ImageMatching": "2.0",
            "ImageMasking": "3.0",
            "DepthMap": "4.0",
            "PrepareDenseScene": "3.0",
            "Texturing": "6.0",
            "FeatureMatching": "2.0",
            "StructureFromMotion": "3.1",
            "FeatureExtraction": "1.2"
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
                "0": "33168a541b99d02884a281e88e7f888a7c7a1faa"
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
                "0": "9196aef28cc668f7ce342835a36a370d6f5a55d5"
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
                "size": 82,
                "split": 9
            },
            "uids": {
                "0": "b060a0f2fa68ec4457fefe9210431e7ad84e0aed"
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
                "size": 82,
                "split": 1
            },
            "uids": {
                "0": "e1b8bc91a4e00842823c3d617a8f9512e4c1ead4"
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
                "size": 82,
                "split": 3
            },
            "uids": {
                "0": "60fc4a1ca22ebeb68eab42890cb18099a82c080b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "{ImageMasking_1.output}",
                "describerTypes": [
                    "sift",
                    "akaze"
                ],
                "describerPreset": "high",
                "maxNbFeatures": 0,
                "describerQuality": "high",
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
                803,
                -19
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 82,
                "split": 1
            },
            "uids": {
                "0": "6c80f5b72728388eff7f74c23ca592c72688181d"
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
                "initialPairA": "391790923",
                "initialPairB": "1470755491",
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
                "size": 82,
                "split": 3
            },
            "uids": {
                "0": "ec79af1d4054b780010609bf36b2d26f846518bc"
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
                "size": 82,
                "split": 1
            },
            "uids": {
                "0": "397a6342fa6d60b1e9db999c355b2ee8f8d0e350"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 28872286,
                        "poseId": 28872286,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0089.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 57213719,
                        "poseId": 57213719,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0102.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 68793498,
                        "poseId": 68793498,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0106.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 76286455,
                        "poseId": 76286455,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0091.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 100677761,
                        "poseId": 100677761,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0134.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 112981488,
                        "poseId": 112981488,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0023.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 125145683,
                        "poseId": 125145683,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0141.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 202833196,
                        "poseId": 202833196,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0147.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 245883779,
                        "poseId": 245883779,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0149.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 276483888,
                        "poseId": 276483888,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0087.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 284856182,
                        "poseId": 284856182,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0099.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 303622418,
                        "poseId": 303622418,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0035.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 307106068,
                        "poseId": 307106068,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0016.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 310466751,
                        "poseId": 310466751,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0152.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 362854380,
                        "poseId": 362854380,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0017.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 397895593,
                        "poseId": 397895593,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0139.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 415089846,
                        "poseId": 415089846,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0098.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 468104626,
                        "poseId": 468104626,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0130.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 512856015,
                        "poseId": 512856015,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0111.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 515175022,
                        "poseId": 515175022,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0107.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 558879310,
                        "poseId": 558879310,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0108.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 623636295,
                        "poseId": 623636295,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0104.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 635480183,
                        "poseId": 635480183,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0094.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 679333382,
                        "poseId": 679333382,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0036.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 681429458,
                        "poseId": 681429458,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0015.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 744936175,
                        "poseId": 744936175,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0150.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 749476746,
                        "poseId": 749476746,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0018.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 752637008,
                        "poseId": 752637008,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0032.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 775417772,
                        "poseId": 775417772,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0028.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 780095299,
                        "poseId": 780095299,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0140.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 796281720,
                        "poseId": 796281720,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0115.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 823841766,
                        "poseId": 823841766,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0154.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 824636774,
                        "poseId": 824636774,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0145.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 829214010,
                        "poseId": 829214010,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0088.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 849324127,
                        "poseId": 849324127,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0103.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 851288044,
                        "poseId": 851288044,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0129.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 885753400,
                        "poseId": 885753400,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0142.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 894693465,
                        "poseId": 894693465,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0132.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 930191892,
                        "poseId": 930191892,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0105.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 965420798,
                        "poseId": 965420798,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0085.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 965510075,
                        "poseId": 965510075,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0136.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 975690081,
                        "poseId": 975690081,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0026.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 986027385,
                        "poseId": 986027385,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0090.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1008662934,
                        "poseId": 1008662934,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0031.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1046963858,
                        "poseId": 1046963858,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0148.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1058591896,
                        "poseId": 1058591896,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0086.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1084681501,
                        "poseId": 1084681501,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0135.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1086462947,
                        "poseId": 1086462947,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0038.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1104457921,
                        "poseId": 1104457921,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0143.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1161438604,
                        "poseId": 1161438604,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0021.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1178037863,
                        "poseId": 1178037863,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0137.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1273481636,
                        "poseId": 1273481636,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0093.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1287071474,
                        "poseId": 1287071474,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0138.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1301896208,
                        "poseId": 1301896208,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0030.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1376002568,
                        "poseId": 1376002568,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0144.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1379040825,
                        "poseId": 1379040825,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0101.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1444738233,
                        "poseId": 1444738233,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0019.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1459816363,
                        "poseId": 1459816363,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0024.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1462692650,
                        "poseId": 1462692650,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0027.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1482020235,
                        "poseId": 1482020235,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0113.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1490574736,
                        "poseId": 1490574736,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0153.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1513599452,
                        "poseId": 1513599452,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0131.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1518847133,
                        "poseId": 1518847133,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0100.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1545759528,
                        "poseId": 1545759528,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0037.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1550915258,
                        "poseId": 1550915258,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0109.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1584323239,
                        "poseId": 1584323239,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0096.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1609181403,
                        "poseId": 1609181403,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0029.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1672722849,
                        "poseId": 1672722849,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0022.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1674709461,
                        "poseId": 1674709461,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0025.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1676192086,
                        "poseId": 1676192086,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0020.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1724747487,
                        "poseId": 1724747487,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0095.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1747978399,
                        "poseId": 1747978399,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0110.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1752689264,
                        "poseId": 1752689264,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0146.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1838486235,
                        "poseId": 1838486235,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0151.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1855364980,
                        "poseId": 1855364980,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0133.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1887447302,
                        "poseId": 1887447302,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0092.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1943821380,
                        "poseId": 1943821380,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0112.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1947882207,
                        "poseId": 1947882207,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0155.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1957354588,
                        "poseId": 1957354588,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0114.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1982709593,
                        "poseId": 1982709593,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0034.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2056599045,
                        "poseId": 2056599045,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0033.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2142983602,
                        "poseId": 2142983602,
                        "path": "D:/ly/stage3/gun2/blur correction face 1/output_0097.png",
                        "intrinsicId": 1259178468,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1259178468,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "D:/ly/stage3/gun2/blur correction face 1",
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
                "size": 82,
                "split": 28
            },
            "uids": {
                "0": "16bab6dfe7f4a069e7abdad06fe757ebcede765a"
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
                "0": "aa851aba2318d979a03409ace62b67f690af7a6c"
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
                "size": 82,
                "split": 5
            },
            "uids": {
                "0": "2db9120b47a567fde72506ddc5e304e6a9e7aab6"
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
                113,
                164
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 82,
                "split": 3
            },
            "uids": {
                "0": "7711cfa10f86585ab463b1b1f7e5cbe0c50ff282"
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
        },
        "FeatureMatching_2": {
            "nodeType": "FeatureMatching",
            "position": [
                500,
                165
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 82,
                "split": 5
            },
            "uids": {
                "0": "5f01c021e8720640dd2e944a9d1cfe12ae9094fb"
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
                "crossMatching": true,
                "guidedMatching": true,
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
        "StructureFromMotion_2": {
            "nodeType": "StructureFromMotion",
            "position": [
                792,
                192
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 82,
                "split": 1
            },
            "uids": {
                "0": "ecd378ca9dd42872f0b8ffee7fd55d2e9a4aaf18"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_2.input}",
                "featuresFolders": "{FeatureMatching_2.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_2.output}"
                ],
                "describerTypes": "{FeatureMatching_2.describerTypes}",
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
                "initialPairA": "391790923",
                "initialPairB": "1470755491",
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
        "DepthMapFilter_2": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                160
            ],
            "parallelization": {
                "blockSize": 10,
                "size": 82,
                "split": 9
            },
            "uids": {
                "0": "a000e1ba7846d308ffb03aec86c06722deb6704e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_2.input}",
                "depthMapsFolder": "{DepthMap_2.output}",
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
        "Meshing_2": {
            "nodeType": "Meshing",
            "position": [
                1587,
                166
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "fd10eef5be325ff8da1c7bde1d29c4c5ac694a1b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_2.input}",
                "depthMapsFolder": "{DepthMapFilter_2.output}",
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
        "Texturing_2": {
            "nodeType": "Texturing",
            "position": [
                2000,
                160
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "e513ea641b84d5352e179c076580cca3cf3cac7b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_2.output}",
                "imagesFolder": "{DepthMap_2.imagesFolder}",
                "inputMesh": "{MeshFiltering_2.outputMesh}",
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
        "MeshFiltering_2": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                160
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "547b305fc973a8026d5a3ab2c584c4bb6bcf8e19"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_2.outputMesh}",
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
        "DepthMap_2": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                160
            ],
            "parallelization": {
                "blockSize": 3,
                "size": 82,
                "split": 28
            },
            "uids": {
                "0": "cee9b46f461ae414a4b7bc6755ea80e3d587863e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_2.input}",
                "imagesFolder": "{PrepareDenseScene_2.output}",
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
        "PrepareDenseScene_2": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                160
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 82,
                "split": 3
            },
            "uids": {
                "0": "c27643ca9399709c81de4ad4fe9cbb01a0fb6ab6"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_2.output}",
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
        }
    }
}
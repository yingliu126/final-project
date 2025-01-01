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
                "0": "dfd1fe8fa511a6f614916ad2bc424d4038315eba"
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
                "0": "acc4706efaff63fa140cda6a15caf658e1c40979"
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
                "size": 33,
                "split": 4
            },
            "uids": {
                "0": "38a71f767defc7c5bd4d51bcdfa68c663b5c014b"
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
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "90a7cb964a2a734794259eb63383900ea1cde947"
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
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "7057c81a22f671b81e59d8ee88cf08249a9a5387"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "{ImageMasking_1.output}",
                "describerTypes": [
                    "sift",
                    "akaze"
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
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "a2c3f805bda28b3da8ed05994b2aca7a95ed9d83"
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
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "9a32e7a3807f51358b0195910f6f5665342d871d"
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
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "6d2166b850f10d6bcc152e8edd4068207e727ce2"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 93936248,
                        "poseId": 93936248,
                        "path": "D:/ly/stage3/gun9/output png/output_0013.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 428209627,
                        "poseId": 428209627,
                        "path": "D:/ly/stage3/gun9/output png/output_0084.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 470870235,
                        "poseId": 470870235,
                        "path": "D:/ly/stage3/gun9/output png/output_0080.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 476365090,
                        "poseId": 476365090,
                        "path": "D:/ly/stage3/gun9/output png/output_0081.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 558742930,
                        "poseId": 558742930,
                        "path": "D:/ly/stage3/gun9/output png/output_0076.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 561377097,
                        "poseId": 561377097,
                        "path": "D:/ly/stage3/gun9/output png/output_0077.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 659676646,
                        "poseId": 659676646,
                        "path": "D:/ly/stage3/gun9/output png/output_0109.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 666514217,
                        "poseId": 666514217,
                        "path": "D:/ly/stage3/gun9/output png/output_0108.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 671882926,
                        "poseId": 671882926,
                        "path": "D:/ly/stage3/gun9/output png/output_0113.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 672334317,
                        "poseId": 672334317,
                        "path": "D:/ly/stage3/gun9/output png/output_0111.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 673866789,
                        "poseId": 673866789,
                        "path": "D:/ly/stage3/gun9/output png/output_0116.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 674172529,
                        "poseId": 674172529,
                        "path": "D:/ly/stage3/gun9/output png/output_0110.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 697741864,
                        "poseId": 697741864,
                        "path": "D:/ly/stage3/gun9/output png/output_0115.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 706804547,
                        "poseId": 706804547,
                        "path": "D:/ly/stage3/gun9/output png/output_0078.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 711495502,
                        "poseId": 711495502,
                        "path": "D:/ly/stage3/gun9/output png/output_0079.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 777860238,
                        "poseId": 777860238,
                        "path": "D:/ly/stage3/gun9/output png/output_0015.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 779548555,
                        "poseId": 779548555,
                        "path": "D:/ly/stage3/gun9/output png/output_0016.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 803508626,
                        "poseId": 803508626,
                        "path": "D:/ly/stage3/gun9/output png/output_0018.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 813909401,
                        "poseId": 813909401,
                        "path": "D:/ly/stage3/gun9/output png/output_0019.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 822668603,
                        "poseId": 822668603,
                        "path": "D:/ly/stage3/gun9/output png/output_0017.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 833450623,
                        "poseId": 833450623,
                        "path": "D:/ly/stage3/gun9/output png/output_0014.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1028257294,
                        "poseId": 1028257294,
                        "path": "D:/ly/stage3/gun9/output png/output_0086.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1030543239,
                        "poseId": 1030543239,
                        "path": "D:/ly/stage3/gun9/output png/output_0085.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1074969821,
                        "poseId": 1074969821,
                        "path": "D:/ly/stage3/gun9/output png/output_0026.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1094971048,
                        "poseId": 1094971048,
                        "path": "D:/ly/stage3/gun9/output png/output_0021.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1098136037,
                        "poseId": 1098136037,
                        "path": "D:/ly/stage3/gun9/output png/output_0020.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1117579620,
                        "poseId": 1117579620,
                        "path": "D:/ly/stage3/gun9/output png/output_0023.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1118875765,
                        "poseId": 1118875765,
                        "path": "D:/ly/stage3/gun9/output png/output_0022.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1194389711,
                        "poseId": 1194389711,
                        "path": "D:/ly/stage3/gun9/output png/output_0024.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1880277201,
                        "poseId": 1880277201,
                        "path": "D:/ly/stage3/gun9/output png/output_0107.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1883861821,
                        "poseId": 1883861821,
                        "path": "D:/ly/stage3/gun9/output png/output_0105.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1945734119,
                        "poseId": 1945734119,
                        "path": "D:/ly/stage3/gun9/output png/output_0106.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    },
                    {
                        "viewId": 1978234475,
                        "poseId": 1978234475,
                        "path": "D:/ly/stage3/gun9/output png/output_0112.png",
                        "intrinsicId": 3297616337,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"none\", \"XResolution\": \"1\", \"YResolution\": \"1\", \"oiio:ColorSpace\": \"Gamma2\", \"oiio:Gamma\": \"1.96\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 3297616337,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "D:/ly/stage3/gun9/output png",
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
                "size": 33,
                "split": 11
            },
            "uids": {
                "0": "1e911bba90d3b7be79779c56b01f894520f6d440"
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
                "0": "e132653e53e43b271eb5b86f724edb23feff2d22"
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
                "size": 33,
                "split": 2
            },
            "uids": {
                "0": "976a830a545f2b6bd7aad71454e08cb6295e92d0"
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
                81,
                169
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "eb164063bc971b65f47364d459ca8a469193595a"
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
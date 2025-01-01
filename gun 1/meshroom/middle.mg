{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "FeatureExtraction": "1.2",
            "Texturing": "6.0",
            "MeshFiltering": "3.0",
            "DepthMap": "4.0",
            "Meshing": "7.0",
            "ImageMatching": "2.0",
            "PrepareDenseScene": "3.0",
            "FeatureMatching": "2.0",
            "DepthMapFilter": "3.0",
            "CameraInit": "9.0",
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
                "0": "c96e6d0ae61c1adc6d9a7862ec4629aadfafa24c"
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
                "0": "164e8c8fce256af4552577db4487c71279472a98"
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
                "size": 23,
                "split": 3
            },
            "uids": {
                "0": "9d236f11b55f45776d6123ccc7f8e7fc261ae8b4"
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
                "size": 23,
                "split": 1
            },
            "uids": {
                "0": "263e5fdee7e5f7f3b75b357dd0957430bf8997e9"
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
                "size": 23,
                "split": 1
            },
            "uids": {
                "0": "4643310cd91cb78efb3ba1ae7578e74414d6a775"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "describerTypes": [
                    "dspsift",
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
                "size": 23,
                "split": 1
            },
            "uids": {
                "0": "0384390a2a15f170061f9ddc71a7b4b4374edd72"
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
                "size": 23,
                "split": 1
            },
            "uids": {
                "0": "6581d42bfc80d3425350f65efb23112a28226bfa"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
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
                "size": 23,
                "split": 1
            },
            "uids": {
                "0": "0cdd1f408312de479341f2dbed1102b29655bbef"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 164091722,
                        "poseId": 164091722,
                        "path": "D:/ly/stage3/output/00569.jpg",
                        "intrinsicId": 3015513586,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"555427794\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1667172574\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 170277083,
                        "poseId": 170277083,
                        "path": "D:/ly/stage3/output/00438.jpg",
                        "intrinsicId": 3349624817,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"835511484\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"84110452\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 217127179,
                        "poseId": 217127179,
                        "path": "D:/ly/stage3/output/00446.jpg",
                        "intrinsicId": 2367995353,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"657048788\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"818742437\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 426788462,
                        "poseId": 426788462,
                        "path": "D:/ly/stage3/output/00536.jpg",
                        "intrinsicId": 3989050289,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"976179732\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1206916615\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 501976554,
                        "poseId": 501976554,
                        "path": "D:/ly/stage3/output/00545.jpg",
                        "intrinsicId": 1733341443,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1490960625\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1976803787\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 629307324,
                        "poseId": 629307324,
                        "path": "D:/ly/stage3/output/00404.jpg",
                        "intrinsicId": 3470182412,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1151336391\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1512479472\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 630856452,
                        "poseId": 630856452,
                        "path": "D:/ly/stage3/output/00554.jpg",
                        "intrinsicId": 2125266280,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"209827714\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"993573096\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 803676473,
                        "poseId": 803676473,
                        "path": "D:/ly/stage3/output/00490.jpg",
                        "intrinsicId": 3620764584,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"149079467\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1854712910\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 824772140,
                        "poseId": 824772140,
                        "path": "D:/ly/stage3/output/00595.jpg",
                        "intrinsicId": 2609231313,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1345505529\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1401886648\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 826689891,
                        "poseId": 826689891,
                        "path": "D:/ly/stage3/output/00578.jpg",
                        "intrinsicId": 3684182662,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1812526912\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1221590670\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1173156014,
                        "poseId": 1173156014,
                        "path": "D:/ly/stage3/output/00464.jpg",
                        "intrinsicId": 2549449729,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1556873871\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1448000854\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1294022020,
                        "poseId": 1294022020,
                        "path": "D:/ly/stage3/output/00415.jpg",
                        "intrinsicId": 218924736,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"960240576\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"948638778\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1393916116,
                        "poseId": 1393916116,
                        "path": "D:/ly/stage3/output/00529.jpg",
                        "intrinsicId": 3157239502,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"211979255\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"772183073\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1532817372,
                        "poseId": 1532817372,
                        "path": "D:/ly/stage3/output/00392.jpg",
                        "intrinsicId": 2103274796,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"691903430\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"664262966\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1551046957,
                        "poseId": 1551046957,
                        "path": "D:/ly/stage3/output/00426.jpg",
                        "intrinsicId": 2741880559,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1686675270\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1630776102\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1589201825,
                        "poseId": 1589201825,
                        "path": "D:/ly/stage3/output/00562.jpg",
                        "intrinsicId": 1916126437,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1348364315\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"185506365\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1593651717,
                        "poseId": 1593651717,
                        "path": "D:/ly/stage3/output/00521.jpg",
                        "intrinsicId": 2128368200,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"729251576\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"626790252\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1709764267,
                        "poseId": 1709764267,
                        "path": "D:/ly/stage3/output/00607.jpg",
                        "intrinsicId": 2392816140,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"370252150\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"2016285086\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1760293194,
                        "poseId": 1760293194,
                        "path": "D:/ly/stage3/output/00453.jpg",
                        "intrinsicId": 3318725010,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1925979381\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"14560069\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1793596564,
                        "poseId": 1793596564,
                        "path": "D:/ly/stage3/output/00470.jpg",
                        "intrinsicId": 3731687151,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"866748945\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1629655021\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1934235123,
                        "poseId": 1934235123,
                        "path": "D:/ly/stage3/output/00592.jpg",
                        "intrinsicId": 4072133098,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"2050444701\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1363138969\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1974755964,
                        "poseId": 1974755964,
                        "path": "D:/ly/stage3/output/00507.jpg",
                        "intrinsicId": 170756964,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"1772956976\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1641265183\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2055397193,
                        "poseId": 2055397193,
                        "path": "D:/ly/stage3/output/00433.jpg",
                        "intrinsicId": 3275367511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Exif:BodySerialNumber\": \"664491906\", \"Exif:ExifVersion\": \"0230\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"0\", \"Exif:ImageUniqueID\": \"1212242262\", \"Orientation\": \"1\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 170756964,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1772956976",
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
                    },
                    {
                        "intrinsicId": 218924736,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "960240576",
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
                    },
                    {
                        "intrinsicId": 1733341443,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1490960625",
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
                    },
                    {
                        "intrinsicId": 1916126437,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1348364315",
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
                    },
                    {
                        "intrinsicId": 2103274796,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "691903430",
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
                    },
                    {
                        "intrinsicId": 2125266280,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "209827714",
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
                    },
                    {
                        "intrinsicId": 2128368200,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "729251576",
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
                    },
                    {
                        "intrinsicId": 2367995353,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "657048788",
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
                    },
                    {
                        "intrinsicId": 2392816140,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "370252150",
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
                    },
                    {
                        "intrinsicId": 2549449729,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1556873871",
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
                    },
                    {
                        "intrinsicId": 2609231313,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1345505529",
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
                    },
                    {
                        "intrinsicId": 2741880559,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1686675270",
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
                    },
                    {
                        "intrinsicId": 3015513586,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "555427794",
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
                    },
                    {
                        "intrinsicId": 3157239502,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "211979255",
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
                    },
                    {
                        "intrinsicId": 3275367511,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "664491906",
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
                    },
                    {
                        "intrinsicId": 3318725010,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1925979381",
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
                    },
                    {
                        "intrinsicId": 3349624817,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "835511484",
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
                    },
                    {
                        "intrinsicId": 3470182412,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1151336391",
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
                    },
                    {
                        "intrinsicId": 3620764584,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "149079467",
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
                    },
                    {
                        "intrinsicId": 3684182662,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "1812526912",
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
                    },
                    {
                        "intrinsicId": 3731687151,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "866748945",
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
                    },
                    {
                        "intrinsicId": 3989050289,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "976179732",
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
                    },
                    {
                        "intrinsicId": 4072133098,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 1920,
                        "height": 1080,
                        "sensorWidth": 36.0,
                        "sensorHeight": 20.25,
                        "serialNumber": "2050444701",
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
                "size": 23,
                "split": 8
            },
            "uids": {
                "0": "81c8d651f55a6b19d4b1b0fa56f43e9f4c5299f4"
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
                "0": "dfe1d352b9fc434f655e2a8974771ef5e4f8deb5"
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
                "size": 23,
                "split": 2
            },
            "uids": {
                "0": "1b96539532134ffd3b64a83ce2dbee893e8ac2a1"
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
        }
    }
}
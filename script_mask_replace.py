import json
import os
import shutil

# 读取SFM文件内容
with open(r'D:\ly\stage3\gun2\MeshroomCache\CameraInit\397a6342fa6d60b1e9db999c355b2ee8f8d0e350\cameraInit.sfm', 'r') as f: # 替换为真实的 sfm 文件路径
    sfm_data = json.load(f)

# 替换为图片所在的文件夹路径
images_folder = "D:\\ly\\stage3\\test"
print(os.listdir(images_folder))  # 列出文件夹中的所有文件


# 遍历SFM数据中的views
for view in sfm_data['views']:
    frame_id = view['frameId']  # 获取frameId
    view_id = view['viewId']    # 获取viewId
    image_filename = f"maskoutput_{frame_id.zfill(4)}.png"  # 根据frameId生成图片文件名
    old_image_path = os.path.join(images_folder, image_filename)  # 构建原图片路径

    # 如果图片存在则重命名为viewId
    if os.path.exists(old_image_path):
        new_image_filename = f"{view_id}.png"
        new_image_path = os.path.join(images_folder, new_image_filename)
        shutil.move(old_image_path, new_image_path)  # 重命名图片文件
        print(f"Renamed {image_filename} to {new_image_filename}")
    else:
        print(f"Image {image_filename} not found.")

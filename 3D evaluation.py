import open3d as o3d
import numpy as np
from sklearn.neighbors import NearestNeighbors
from sklearn.decomposition import PCA

# Load 3D model and convert mesh to point cloud
def load_model(file_path):
    # Check if the file is an OBJ format
    if file_path.endswith('.obj'):
        mesh = o3d.io.read_triangle_mesh(file_path)  # Load the triangle mesh
        # Compute normals for the mesh if not already present
        if not mesh.has_vertex_normals():
            mesh.compute_vertex_normals()
        # Sample points uniformly from the mesh to generate a point cloud
        model = mesh.sample_points_uniformly(number_of_points=10000)
        return mesh, model  # Return the mesh and point cloud
    else:
        model = o3d.io.read_point_cloud(file_path)
        return None, model  # Return only the point cloud if not a mesh

# Count the number of faces in a triangle mesh
def count_faces(mesh):
    # Check if the input is a TriangleMesh
    if isinstance(mesh, o3d.geometry.TriangleMesh):
        return len(mesh.triangles)
    else:
        raise ValueError("Input must be a TriangleMesh.") 

# Compute the point cloud density
def compute_point_cloud_density(model):
    # Check if the model is a point cloud
    if isinstance(model, o3d.geometry.PointCloud):
        points = np.asarray(model.points)  # Convert point cloud to numpy array
        # Use KNN to find the 10 neighborhoods of each point
        nbrs = NearestNeighbors(n_neighbors=10, algorithm='auto').fit(points)
        distances, _ = nbrs.kneighbors(points)
        # Compute the average density by taking the mean of the distances
        avg_density = np.mean(distances)
        return avg_density
    else:
        raise ValueError("Input model is not a point cloud.")  

# Compute the surface roughness of the point cloud
# Calculation of surface roughness: For each point, calculate the local plane fitting error between it and the neighboring points (i.e., the distance from the point to the plane), 
# and then quantify the roughness by calculating the standard deviation of the distance. Finally, return the average roughness of all points.
# Meaning of roughness: A larger roughness indicates that the surface is not smooth and the point cloud data shows a large change; 
# a smaller roughness indicates that the surface is relatively smooth and the point cloud data is relatively consistent.

def compute_surface_roughness(model, k=30):
    # Check if the model is a point cloud
    if isinstance(model, o3d.geometry.PointCloud):
        points = np.asarray(model.points)  # Convert point cloud to numpy array
        tree = o3d.geometry.KDTreeFlann(model)  # Build a KD-tree for nearest neighbor search
        roughness = []  # List to store roughness values for each point

        for i in range(len(points)):
            # Find the k nearest neighbors for each point
            _, idx, _ = tree.search_knn_vector_3d(model.points[i], k)
            # Get the coordinates of the neighbors
            neighbors = points[idx]
            # Use PCA to fit a local plane to the neighbors
            pca = PCA(n_components=3)
            pca.fit(neighbors)
            normal = pca.components_[-1]  # The last principal component is the normal vector
            centroid = np.mean(neighbors, axis=0)  # Compute the centroid of the neighbors

            # Calculate the distance from each neighbor to the plane
            distances = np.dot(neighbors - centroid, normal)
            roughness.append(np.std(distances))  # The standard deviation of the distances is the roughness

        return np.mean(roughness)  # Return the average roughness
    else:
        raise ValueError("Input model is not a point cloud.")  # Raise error if not a point cloud

# Main function to evaluate the quality of a 3D model
model_path = "C:/Users/liuying/Desktop/3.obj"  # Path to the model file
mesh, model = load_model(model_path) 

# Evaluate the quality of the model
if mesh is not None:
    num_faces = count_faces(mesh)  # If the model is a mesh, count the faces
    print(f"Number of Faces: {num_faces}")
else:
    print("Model is a point cloud, no face count available.")  

# Compute point cloud density and surface roughness
density = compute_point_cloud_density(model)
roughness = compute_surface_roughness(model)

# Print the evaluation results
print(f"Point Cloud Density: {density}")
print(f"Surface Roughness: {roughness}")

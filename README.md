# Obsidian Docker Setup

This project sets up Obsidian in a Docker container using Docker Compose. It includes a script to initialize user directories, set permissions, and start the container.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

## Project Structure

- `docker-compose.yml`: Docker Compose file for Obsidian
- `start_obsidian.sh`: Bash script to initialize directories and start the Docker container
- `.gitignore`: Git ignore file for project-specific and IDE-specific files

## Setup

1. **Clone the repository:**

   ```sh
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Make the start script executable:**

   ```sh
   chmod +x start_obsidian.sh
   ```

## Usage

1. **Run the start script:**

   ```sh
   ./start_obsidian.sh
   ```

   This script will:
    - Ensure the directories for configuration and vaults exist
    - Set the correct permissions for these directories
    - Pull the latest Docker image for Obsidian
    - Start the Obsidian Docker container

2. **Access Obsidian:**

    - Open your browser and go to `http://localhost:3000` for the Obsidian desktop GUI
    - For HTTPS, go to `https://localhost:3001`

## Docker Compose Details

- **Image**: `lscr.io/linuxserver/obsidian:latest`
- **Ports**:
    - `3000:3000` (Obsidian desktop GUI)
    - `3001:3001` (Obsidian desktop GUI HTTPS)
- **Volumes**:
    - `~/docker_data/obsidian/config:/config`
    - `~/docker_data/obsidian/vaults:/vaults`
- **Environment Variables**:
    - `PUID=1000`: User ID
    - `PGID=1000`: Group ID
    - `TZ=Etc/UTC`: Timezone
- **Devices**: `/dev/dri` (optional for GL support)
- **Security Options**: `seccomp:unconfined` (optional)
- **Shared Memory Size**: `1gb`

## Contributing

Feel free to open issues or submit pull requests if you have any improvements or suggestions.

## License

This project is licensed under the MIT License.
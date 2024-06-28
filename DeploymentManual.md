# Deployment Manual

## Project Architecture and Task Division

1. **Project Architecture and Task Division**
   - Initiated the project by defining its architecture and distributing tasks among team members. This included outlining the roles and responsibilities for server configuration, Docker setup, and CI/CD implementation.

## Server Configuration with Ansible

2. **Server Configuration with Ansible**
   - Utilized Ansible for automating server configuration:
     - Configured Nginx as the web server, ensuring optimal performance and security settings.
     - Set up PostgreSQL, including database initialization and user management, adhering to best practices.
     - Managed application environment variables securely with a `.env` file, ensuring sensitive data protection.

## Docker and Local Deployment

3. **Docker and Local Deployment**

   - Developed Dockerfile and Docker Compose setup:
     - Crafted Dockerfile to containerize the application environment, defining dependencies and runtime configurations.
     - Orchestrated Docker Compose for deployment, testing application functionality in a controlled environment.
     - Verified seamless integration of components within Docker containers to ensure consistency across different deployment environments.

4. **Pre-commit Hooks for Static Code Analysis**

   - Implemented pre-commit hooks to ensure code quality and consistency before committing changes:

     - Configured pre-commit to run various checks and formatting tools. Added the following configuration to the `.pre-commit-config.yaml` file:

       ```yaml
       repos:
         - repo: https://github.com/pre-commit/pre-commit-hooks
           rev: v4.5.0
           hooks:
             - id: check-added-large-files
             - id: end-of-file-fixer
             - id: trailing-whitespace

         - repo: https://github.com/pre-commit/mirrors-prettier
           rev: v3.0.3
           hooks:
             - id: prettier

         - repo: https://github.com/semaphor-dk/dansabel
           rev: 1.4.0
           hooks:
             - id: dansabel
               files: (\.j2)$|/templates/.*
       ```

     - **Hooks Description**:

       - **check-added-large-files**: Prevents adding large files to the repository to avoid unnecessary bloat.
       - **end-of-file-fixer**: Ensures files end with a newline character, adhering to POSIX standards.
       - **trailing-whitespace**: Removes trailing whitespace characters from files, maintaining clean code.
       - **prettier**: Formats code according to Prettier's style guidelines, ensuring consistent code formatting across the project.
       - **dansabel**: Lints Jinja2 template files (matching `(\.j2)$|/templates/.*`) to maintain template syntax and style consistency.

     - Now, every commit triggers these hooks, preventing code that doesn't meet the quality standards from being committed.

## GitHub Actions Workflow

5. **GitHub Actions Workflow**
   - Implemented GitHub Actions for automated deployment workflows:
     - Created a CI/CD pipeline with GitHub Actions, leveraging its flexibility and integration capabilities.
     - Defined multiple jobs in the workflow to automate deployment steps:
       - **Build Docker Image**: Automated the process of building Docker images based on code changes.
       - **Push to Docker Hub**: Integrated Docker Hub to store and manage Docker images securely.
       - **Deploy to EC2 Server**: Orchestrated deployment to an EC2 instance, ensuring continuous delivery of updated application versions.

## Conclusion

This comprehensive deployment manual documents the step-by-step approach to deploying the application using Ansible for server configuration, Docker for containerization, pre-commit hooks for static code analysis, and GitHub Actions for automated CI/CD workflows. Each section provides detailed instructions and configurations to facilitate efficient deployment and maintenance of the application infrastructure.

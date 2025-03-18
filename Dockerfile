# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy your BigCapital project files into the container
COPY . /app

# Install required Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port BigCapital listens on
EXPOSE 8000

# Set a default environment variable (this can be overridden later)
ENV BASE_URL=http://localhost:8000

# Run BigCapital (adjust the command if needed)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

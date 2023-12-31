# Use an official Python runtime as a parent image
FROM python:3.9

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 8000 to allow outside requests
EXPOSE 8000

# Run app.py when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project_name.wsgi:application"]

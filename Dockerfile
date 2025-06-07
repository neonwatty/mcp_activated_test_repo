# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Create a non-root user
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

# Copy requirements file (if it exists)
COPY --chown=appuser:appuser requirements.txt* .

# Install dependencies (if requirements.txt exists)
RUN if [ -f "requirements.txt" ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copy application code
COPY --chown=appuser:appuser . .

# Command to run the application
CMD ["python", "app.py"] 
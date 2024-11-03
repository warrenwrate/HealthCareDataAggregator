# src/connectors/db_connector.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.pool import QueuePool
from contextlib import contextmanager
import os
from typing import Generator
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class DatabaseConnector:
    def __init__(self):
        # Connection parameters (move to .env later)
        self.DB_URL = "postgresql://username:password@localhost:5432/dbname"
        
        # Create engine with connection pooling
        self.engine = create_engine(
            self.DB_URL,
            poolclass=QueuePool,
            pool_size=5,              # Base number of connections
            max_overflow=10,          # Additional connections when pool is full
            pool_timeout=30,          # Seconds to wait for available connection
            pool_pre_ping=True,       # Verify connection before usage
            pool_recycle=3600,        # Recycle connections after 1 hour
        )
        
        # Create session factory
        self.SessionLocal = sessionmaker(
            bind=self.engine,
            autocommit=False,
            autoflush=False
        )

    @contextmanager
    def get_session(self) -> Generator[Session, None, None]:
        """
        Context manager for database sessions.
        Ensures proper cleanup of sessions.
        """
        session = self.SessionLocal()
        try:
            logger.debug("Database session started")
            yield session
            session.commit()
            logger.debug("Database session committed")
        except Exception as e:
            session.rollback()
            logger.error(f"Error during database session: {str(e)}")
            raise
        finally:
            session.close()
            logger.debug("Database session closed")

    def check_connection(self) -> bool:
        """Test database connection"""
        try:
            with self.get_session() as session:
                session.execute("SELECT 1")
                logger.info("Database connection test successful")
                return True
        except Exception as e:
            logger.error(f"Database connection test failed: {str(e)}")
            return False

# Create singleton instance
db_connector = DatabaseConnector()

# Example usage
if __name__ == "__main__":
    # Test the connection
    if db_connector.check_connection():
        print("Database connection successful!")
        
        # Example of using the session
        with db_connector.get_session() as session:
            # Your database operations here
            pass
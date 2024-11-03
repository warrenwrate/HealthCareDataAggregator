# src/collectors/inbound/inbound.py
from src.connectors.sqlconnector import db_connector

class InboundProcessor:
    def process_file(self, filename):
        # Use the database connection
        with db_connector.get_session() as session:
            try:
                # Your database operations here
                # For example:
                results = session.execute("SELECT * FROM your_table")
                # Process results...
                
            except Exception as e:
                print(f"Error processing file: {str(e)}")
                raise

# Example usage
if __name__ == "__main__":
    processor = InboundProcessor()
    processor.process_file("example.csv")
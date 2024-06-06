import psycopg2
from PyPDF2 import PdfReader

# Function to extract text from a PDF file
def extract_text_from_pdf(pdf_file_path):
    text = ""
    with open(pdf_file_path, 'rb') as f:
        reader = PdfReader(f)
        for page in reader.pages:
            text += page.extract_text()
    return text

# Initialize connection and cursor to None
conn = None
cur = None

try:
    # Connect to your PostgreSQL database
    conn = psycopg2.connect(
        dbname="your dbname",
        user="your username",
        password="your pw",
        host="host name",
        port="5432"
    )

    # Create a cursor object
    cur = conn.cursor()

    # Create a table to store the text if it doesn't already exist
    cur.execute("""
        CREATE TABLE IF NOT EXISTS chapters_text (
            chapter_id SERIAL PRIMARY KEY,
            text TEXT
        )
    """)

    # Extract text from the PDF file
    pdf_file_path = 'C:\\Users\\Yoga X380\\Desktop\\Image_store\\biologyAS.pdf'
    chapters_text = extract_text_from_pdf(pdf_file_path)

    # Split the text into chapters or sections (if needed)
    # For example, you could split by specific keywords or patterns
    # and insert each chapter's text separately into the database

    # Insert the extracted text into the database table
    cur.execute("INSERT INTO chapters_text (text) VALUES (%s)", (chapters_text,))

    # Commit the transaction
    conn.commit()

except psycopg2.Error as e:
    print(f"Database error: {e}")
except Exception as e:
    print(f"Error: {e}")
finally:
    # Close the cursor and database connection
    if cur is not None:
        cur.close()
    if conn is not None:
        conn.close()

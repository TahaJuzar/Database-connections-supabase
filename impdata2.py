import os
from supabase import create_client, Client
# Set Supabase URL and API key directly in the script
supabase_url = "url of your project"
api_key = "your project api key"
# Create a Supabase client
supabase = create_client(supabase_url, api_key)
response = supabase.table('chapters_text').select("*").execute()
data, count = supabase.table('chapters_text').insert({"text":"sdbbduhsasnoS", "name": "Taha"}).execute()
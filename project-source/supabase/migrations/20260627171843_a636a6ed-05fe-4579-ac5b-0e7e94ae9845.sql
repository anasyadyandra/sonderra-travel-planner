
CREATE TABLE public.saved_trips (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  destination TEXT NOT NULL,
  destination_id TEXT,
  duration INTEGER NOT NULL,
  travel_style TEXT,
  departure_city TEXT,
  user_budget NUMERIC,
  estimated_total NUMERIC,
  plan_data JSONB NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.saved_trips TO authenticated;
GRANT ALL ON public.saved_trips TO service_role;
ALTER TABLE public.saved_trips ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage their own trips" ON public.saved_trips
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE INDEX saved_trips_user_id_idx ON public.saved_trips(user_id, created_at DESC);

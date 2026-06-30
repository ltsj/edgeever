CREATE TABLE profile_snapshots (
  id TEXT PRIMARY KEY,
  profile_json TEXT NOT NULL CHECK (json_valid(profile_json)),
  source_memo_ids_json TEXT NOT NULL DEFAULT '[]' CHECK (json_valid(source_memo_ids_json)),
  memo_count INTEGER NOT NULL DEFAULT 0 CHECK (memo_count >= 0),
  model TEXT NOT NULL,
  generated_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now'))
);

CREATE INDEX idx_profile_snapshots_created
  ON profile_snapshots(created_at DESC);

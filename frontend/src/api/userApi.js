const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || '';

export async function fetchUsers() {
  const response = await fetch(`${API_BASE_URL}/api/users`);
  if (!response.ok) {
    throw new Error(`Failed to fetch users: ${response.status}`);
  }
  const payload = await response.json();
  return payload.data || [];
}

export async function createUser(user) {
  const response = await fetch(`${API_BASE_URL}/api/users`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user)
  });

  const payload = await response.json();
  if (!response.ok || !payload.success) {
    throw new Error(payload.message || `Failed to create user: ${response.status}`);
  }

  return payload;
}

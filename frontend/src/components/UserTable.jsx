export default function UserTable({ users, loading }) {
  if (loading) {
    return <p className="muted-text">Loading users from backend...</p>;
  }

  if (users.length === 0) {
    return <p className="muted-text">No users found.</p>;
  }

  return (
    <table className="user-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Username</th>
          <th>Email</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        {users.map((user) => (
          <tr key={user.id}>
            <td>{user.id}</td>
            <td>{user.username}</td>
            <td>{user.email}</td>
            <td>{user.status}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}


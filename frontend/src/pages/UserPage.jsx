import { useEffect, useState } from 'react';
import { createUser, fetchUsers } from '../api/userApi';
import UserTable from '../components/UserTable';

export default function UserPage() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [form, setForm] = useState({
    username: '',
    email: '',
    status: 'ACTIVE'
  });

  useEffect(() => {
    let active = true;

    async function loadUsers() {
      try {
        const data = await fetchUsers();
        if (active) {
          setUsers(data);
          setError('');
        }
      } catch (err) {
        if (active) {
          setError(err.message || 'Unknown error');
        }
      } finally {
        if (active) {
          setLoading(false);
        }
      }
    }

    loadUsers();
    return () => {
      active = false;
    };
  }, []);

  function handleChange(event) {
    const { name, value } = event.target;
    setForm((current) => ({
      ...current,
      [name]: value
    }));
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setSubmitting(true);
    try {
      await createUser(form);
      const nextUsers = await fetchUsers();
      setUsers(nextUsers);
      setError('');
      setForm({
        username: '',
        email: '',
        status: 'ACTIVE'
      });
    } catch (err) {
      setError(err.message || 'Unknown error');
    } finally {
      setSubmitting(false);
    }
  }

  return (
    <main className="page-shell">
      <section className="hero-card">
        <p className="eyebrow">React + Spring Boot</p>
        <h1>CMB China Demo Workspace</h1>
        <p className="hero-copy">
          Frontend is served by Vite and proxies requests to the Spring Boot backend.
        </p>
      </section>
      <section className="content-card">
        <div className="section-header">
          <h2>User List</h2>
          <span className="status-pill">{loading ? 'Loading' : 'Ready'}</span>
        </div>
        <form className="user-form" onSubmit={handleSubmit}>
          <input
            name="username"
            placeholder="Username"
            value={form.username}
            onChange={handleChange}
            disabled={submitting}
          />
          <input
            name="email"
            placeholder="Email"
            value={form.email}
            onChange={handleChange}
            disabled={submitting}
          />
          <select name="status" value={form.status} onChange={handleChange} disabled={submitting}>
            <option value="ACTIVE">ACTIVE</option>
            <option value="INACTIVE">INACTIVE</option>
          </select>
          <button type="submit" disabled={submitting}>
            {submitting ? 'Submitting...' : 'Add User'}
          </button>
        </form>
        {error ? <p className="error-text">{error}</p> : <UserTable users={users} loading={loading} />}
      </section>
    </main>
  );
}

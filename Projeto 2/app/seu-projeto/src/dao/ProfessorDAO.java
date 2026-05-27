package dao;

import model.Professor;
import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ProfessorDAO {

    // =====================================
    // SALVAR
    // =====================================
    public void salvar(Professor professor) {

        String sql =
                "INSERT INTO professor(matricula,nome,email,telefone) VALUES(?,?,?,?)";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, professor.getMatricula());
            stmt.setString(2, professor.getNome());
            stmt.setString(3, professor.getEmail());
            stmt.setString(4, professor.getTelefone());

            stmt.execute();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao salvar professor: "
                            + e.getMessage()
            );
        }
    }

    // =====================================
    // LISTAR
    // =====================================
    public List<Professor> listar() {

        List<Professor> lista =
                new ArrayList<>();

        String sql =
                "SELECT * FROM professor";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    stmt.executeQuery();

            while (rs.next()) {

                Professor p =
                        new Professor();

                p.setId(
                        rs.getInt("id")
                );

                p.setMatricula(
                        rs.getString("matricula")
                );

                p.setNome(
                        rs.getString("nome")
                );

                p.setEmail(
                        rs.getString("email")
                );

                p.setTelefone(
                        rs.getString("telefone")
                );

                lista.add(p);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao listar professores: "
                            + e.getMessage()
            );
        }

        return lista;
    }

    // =====================================
    // EXCLUIR
    // =====================================
    public void excluir(int id) {

        String sql =
                "DELETE FROM professor WHERE id=?";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao excluir professor: "
                            + e.getMessage()
            );
        }
    }

    // =====================================
    // ATUALIZAR
    // =====================================
    public void atualizar(Professor professor) {

        String sql =
                "UPDATE professor SET matricula=?, nome=?, email=?, telefone=? WHERE id=?";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, professor.getMatricula());
            stmt.setString(2, professor.getNome());
            stmt.setString(3, professor.getEmail());
            stmt.setString(4, professor.getTelefone());

            stmt.setInt(5, professor.getId());

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao atualizar professor: "
                            + e.getMessage()
            );
        }
    }

    // =====================================
    // BUSCAR POR ID
    // =====================================
    public Professor buscarPorId(int id) {

        String sql =
                "SELECT * FROM professor WHERE id=?";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()) {

                Professor p =
                        new Professor();

                p.setId(
                        rs.getInt("id")
                );

                p.setMatricula(
                        rs.getString("matricula")
                );

                p.setNome(
                        rs.getString("nome")
                );

                p.setEmail(
                        rs.getString("email")
                );

                p.setTelefone(
                        rs.getString("telefone")
                );

                rs.close();
                stmt.close();
                conn.close();

                return p;
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao buscar professor: "
                            + e.getMessage()
            );
        }

        return null;
    }

    // =====================================
    // BUSCAR POR DISCIPLINA
    // =====================================
    public List<Professor> buscarPorDisciplina(int disciplinaId) {

        List<Professor> lista =
                new ArrayList<>();

        String sql =
                "SELECT p.* " +
                        "FROM professor p " +
                        "JOIN professor_disciplina pd " +
                        "ON p.id = pd.professor_id " +
                        "WHERE pd.disciplina_id=?";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, disciplinaId);

            ResultSet rs =
                    stmt.executeQuery();

            while(rs.next()) {

                Professor p =
                        new Professor();

                p.setId(
                        rs.getInt("id")
                );

                p.setMatricula(
                        rs.getString("matricula")
                );

                p.setNome(
                        rs.getString("nome")
                );

                p.setEmail(
                        rs.getString("email")
                );

                p.setTelefone(
                        rs.getString("telefone")
                );

                lista.add(p);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro na consulta: "
                            + e.getMessage()
            );
        }

        return lista;
    }

}
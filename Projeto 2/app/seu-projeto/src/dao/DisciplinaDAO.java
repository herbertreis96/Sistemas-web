package dao;

import model.Disciplina;
import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class DisciplinaDAO {

    public void salvar(Disciplina disciplina) {

        String sql =
                "INSERT INTO disciplina(codigo,nome,carga_horaria) VALUES(?,?,?)";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, disciplina.getCodigo());
            stmt.setString(2, disciplina.getNome());
            stmt.setInt(3, disciplina.getCargaHoraria());

            stmt.execute();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao salvar disciplina: "
                            + e.getMessage()
            );
        }
    }

    public List<Disciplina> listar() {

        List<Disciplina> lista =
                new ArrayList<>();

        String sql =
                "SELECT * FROM disciplina";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    stmt.executeQuery();

            while(rs.next()) {

                Disciplina d =
                        new Disciplina();

                d.setId(
                        rs.getInt("id")
                );

                d.setCodigo(
                        rs.getString("codigo")
                );

                d.setNome(
                        rs.getString("nome")
                );

                d.setCargaHoraria(
                        rs.getInt("carga_horaria")
                );

                lista.add(d);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao listar disciplinas: "
                            + e.getMessage()
            );
        }

        return lista;
    }

    public void excluir(int id) {

        String sql =
                "DELETE FROM disciplina WHERE id=?";

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
                    "Erro ao excluir disciplina: "
                            + e.getMessage()
            );
        }
    }

    public Disciplina buscarPorId(int id) {

        String sql =
                "SELECT * FROM disciplina WHERE id=?";

        Disciplina disciplina =
                new Disciplina();

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, id);

            ResultSet rs =
                    stmt.executeQuery();

            if(rs.next()) {

                disciplina.setId(
                        rs.getInt("id")
                );

                disciplina.setCodigo(
                        rs.getString("codigo")
                );

                disciplina.setNome(
                        rs.getString("nome")
                );

                disciplina.setCargaHoraria(
                        rs.getInt("carga_horaria")
                );
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao buscar disciplina: "
                            + e.getMessage()
            );
        }

        return disciplina;
    }

    public void atualizar(Disciplina disciplina) {

        String sql =
                "UPDATE disciplina SET codigo=?, nome=?, carga_horaria=? WHERE id=?";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, disciplina.getCodigo());
            stmt.setString(2, disciplina.getNome());
            stmt.setInt(3, disciplina.getCargaHoraria());
            stmt.setInt(4, disciplina.getId());

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao atualizar disciplina: "
                            + e.getMessage()
            );
        }
    }
}
package dao;

import model.Turma;
import model.RelatorioProfessor;

import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class TurmaDAO {

    // =====================================
    // SALVAR TURMA
    // =====================================
    public void salvar(Turma turma) {

        String sql =
                "INSERT INTO turma(codigo_turma, professor_id, disciplina_id, semestre, numero_alunos, horario) VALUES(?,?,?,?,?,?)";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setString(1, turma.getCodigoTurma());

            stmt.setInt(2, turma.getProfessorId());

            stmt.setInt(3, turma.getDisciplinaId());

            stmt.setString(4, turma.getSemestre());

            stmt.setInt(5, turma.getNumeroAlunos());

            stmt.setString(6, turma.getHorario());

            stmt.execute();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao salvar turma: "
                            + e.getMessage()
            );
        }
    }

    // =====================================
    // RELATÓRIO PROFESSOR
    // =====================================
    public List<RelatorioProfessor> relatorioProfessor(int professorId) {

        List<RelatorioProfessor> lista =
                new ArrayList<>();

        String sql =
                "SELECT " +
                        "p.nome AS professor, " +
                        "d.nome AS disciplina, " +
                        "SUM(d.carga_horaria) AS carga_total, " +
                        "SUM(t.numero_alunos) AS total_alunos " +
                        "FROM turma t " +
                        "JOIN professor p ON p.id = t.professor_id " +
                        "JOIN disciplina d ON d.id = t.disciplina_id " +
                        "WHERE p.id=? " +
                        "GROUP BY p.nome, d.nome";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, professorId);

            ResultSet rs =
                    stmt.executeQuery();

            while(rs.next()) {

                RelatorioProfessor r =
                        new RelatorioProfessor();

                r.setProfessor(
                        rs.getString("professor")
                );

                r.setDisciplina(
                        rs.getString("disciplina")
                );

                r.setCargaTotal(
                        rs.getInt("carga_total")
                );

                r.setTotalAlunos(
                        rs.getInt("total_alunos")
                );

                lista.add(r);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro relatório: "
                            + e.getMessage()
            );
        }

        return lista;
    }
}
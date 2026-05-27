package dao;

import model.ProfessorDisciplina;
import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProfessorDisciplinaDAO {

    public void salvar(ProfessorDisciplina pd) {

        String sql =
                "INSERT INTO professor_disciplina(professor_id, disciplina_id) VALUES(?,?)";

        try {

            Connection conn =
                    ConnectionFactory.getConnection();

            PreparedStatement stmt =
                    conn.prepareStatement(sql);

            stmt.setInt(1, pd.getProfessorId());
            stmt.setInt(2, pd.getDisciplinaId());

            stmt.execute();

            stmt.close();
            conn.close();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Erro ao salvar relação: "
                            + e.getMessage()
            );
        }
    }
}

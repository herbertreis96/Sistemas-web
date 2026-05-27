package model;

public class RelatorioProfessor {

    private String professor;
    private String disciplina;
    private int cargaTotal;
    private int totalAlunos;

    public RelatorioProfessor() {
    }

    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
    }

    public String getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public int getCargaTotal() {
        return cargaTotal;
    }

    public void setCargaTotal(int cargaTotal) {
        this.cargaTotal = cargaTotal;
    }

    public int getTotalAlunos() {
        return totalAlunos;
    }

    public void setTotalAlunos(int totalAlunos) {
        this.totalAlunos = totalAlunos;
    }
}

package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public interface EmpresaManager {

    /**
     * Busca todos las empresas
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    public ResultSet TodosEmpresas(Connection con) throws SQLException;

    /**
     * Busca todos los usuarios
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    public ResultSet ModificarEmpresa (Connection con, String nomEmp, int idCiu, int idEmp ) throws SQLException;
}

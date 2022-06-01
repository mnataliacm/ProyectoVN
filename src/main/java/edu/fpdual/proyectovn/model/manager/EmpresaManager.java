package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Empresa;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;


public interface EmpresaManager {

    /**
     * Busca todos las empresas
     *
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    Set<Empresa> todos(Connection con);

    /**
     * Busca todos los usuarios
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    public ResultSet modificarEmpresa(Connection con, String nomEmp, Integer idCiu, Integer idEmp) throws SQLException;
}

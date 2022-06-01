package edu.fpdual.proyectovn.model.dao;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.stubbing.Answer;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.mockito.Mockito.any;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class UsuarioTest {

  @Mock
  private ResultSet resultSet;

  @Test
  public void usuarioConstruction_ok() throws SQLException {

    Usuario expectedUsuario = Usuario.builder()
        .nom("Paloma ")
        .ape("Palomar")
        .pass("paloma")
        .email("paloma@email.com")
        .movil("123")
        .id(500)
        .build();

    doReturn(expectedUsuario.getId()).when(resultSet).getInt(any());
    when(resultSet.getString(any())).thenReturn(expectedUsuario.getNom());
    when(resultSet.getString(any())).thenAnswer((Answer<String>) invocationOnMock -> {

      if(invocationOnMock.getArgument(0).equals("NomUsu")){
        return expectedUsuario.getNom();
      } else if(invocationOnMock.getArgument(0).equals("ApeUsu")){
        return expectedUsuario.getApe();
      } else  if(invocationOnMock.getArgument(0).equals("PassUsu")){
        return expectedUsuario.getPass();
      } else if(invocationOnMock.getArgument(0).equals("Email")) {
        return expectedUsuario.getEmail();
      } else if(invocationOnMock.getArgument(0).equals("Movil")) {
        return expectedUsuario.getMovil();
      }else{
        return null;
      }
    });

    //Usuario usuarioActual = new Usuario(resultSet);
    //MatcherAssert.assertThat(usuarioActual, Matchers.is(expectedUsuario));

  }
}

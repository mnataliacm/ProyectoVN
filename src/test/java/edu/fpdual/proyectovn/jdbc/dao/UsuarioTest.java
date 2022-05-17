package edu.fpdual.proyectovn.jdbc.dao;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.junit.jupiter.params.provider.ValueSource;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

public class UsuarioTest {

  Usuario usuario;

  @BeforeAll
  public static void initAll(){
    System.out.println("========BeforeAll========");
  }

  @BeforeEach
  public void init(){
    System.out.println("========BeforeEach========");
    usuario = new Usuario();
    usuario.setId(50);
    usuario.setNom("VAYA");
    usuario.setApe("PLAN");
    usuario.setPass("123");
    usuario.setEmail("vayaplan@email.com");
    usuario.setMovil("123-456-789");
  }

  @AfterEach
  public void destroy(){
    System.out.println("========DestroyEach========");
    usuario = null;
  }

  @AfterAll
  public static void destroyAll(){
    System.out.println("========DestroyAll========");
  }

  @Test
  public void setNombre_ok(){
    assumeTrue(usuario != null);
    String nombre = "Mesa";
    usuario.setNom(nombre.toUpperCase());
    assertAll(
        () -> assertEquals(nombre, usuario.getNom()),
        () -> assertEquals("Castillo", usuario.getApe()),
        () -> assertEquals(222-222-222, usuario.getMovil()));
  }

  @Test
  public void setApellido_ok(){
    assumeTrue(usuario != null);
    String ApeUsu = "Mesa";
    usuario.setApe(ApeUsu.toUpperCase());
    assertNotNull(usuario);
    assertFalse(usuario.getApe().trim().isEmpty());
    assertEquals(ApeUsu.toUpperCase(), usuario.getApe());
  }
/*
  @Test
  public void setEdad_ok(){
    assumeTrue(usuario != null);
    int nuevaEdad = 33;
    usuario.setEdad(nuevaEdad);
    assertThat(usuario.getEdad(), closeTo(34, 1));
  }

  @Test
  public void setHobbies_ok(){
    assumeTrue(usuario != null);
    List<Hobbies> nuevosHobbies = Arrays.asList(Hobbies.TROTAR, Hobbies.VIDEO_JUEGOS, Hobbies.MONTAR_EN_BICI, Hobbies.NADAR);
    usuario.setHobbies(nuevosHobbies);
    assertThat(usuario.getHobbies(), hasSize(4));
    assertThat(usuario.getHobbies(), hasItem(Hobbies.TROTAR));
    assertThat(usuario.getHobbies(), is(nuevosHobbies));
    assertThat(usuario.getHobbies().get(0).getMinutos(), is(Hobbies.TROTAR.getMinutos()));
  }

  @Test
  public void setFechaNacimiento_ok(){
    assumeTrue(persona != null);
    LocalDate nuevaFecha = LocalDate.of(2006,4,24);
    persona.setFechaNacimiento(nuevaFecha);
    assertThat(persona.getFechaNacimiento(), is(nuevaFecha));
  }
*/
  @Test
  public void allArgConstructor_ok(){
    assumeTrue(usuario != null);
    Usuario usuario2 = new Usuario(usuario.getId(), usuario.getNom(), usuario.getApe(), usuario.getEmail(), usuario.getPass(),
         usuario.getMovil());
    assertThat(usuario, is(usuario2));
  }

  @Test
  public void setNombre_ko(){
    assumeTrue(usuario != null);
    assertThrows(NullPointerException.class, () -> usuario.setNom(null));
  }

  @ParameterizedTest
  @ValueSource(ints = {1, 3, 5, -3, 15, Integer.MAX_VALUE}) // six numbers
  void isOdd_ShouldReturnTrueForOddNumbers(int number) {
    assertTrue(number%2!=0);
  }

  @ParameterizedTest
  @NullAndEmptySource
  @ValueSource(strings = {"  ", "\t", "\n"})
  void isBlank_ShouldReturnTrueForAllTypesOfBlankStrings_ok(String input) {
    assertTrue(input==null || input.trim().isEmpty());
  }

  /*@ParameterizedTest
  @CsvSource({"test,TEST", "tEst,TEST", "Java,JAVA"})
  void toUpperCase_ShouldGenerateTheExpectedUppercaseValue_ok(String input, String expected) {
    String actualValue = input.toUpperCase();
    assertEquals(expected, actualValue);
  }

  @ParameterizedTest
  @CsvFileSource(resources = "/data/data.csv", numLinesToSkip = 1)
  void toUpperCase_ShouldGenerateTheExpectedUppercaseValueCSVFile_ok(
      String input, String expected) {
    String actualValue = input.toUpperCase();
    assertEquals(expected, actualValue);
  }*/

}

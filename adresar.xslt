<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:adr="http://viser.edu.rs/ISIT">

  <xsl:variable name ="tabelaOsoba">
    <h2>Osobe</h2>
    <tr>
      <th>Ime</th>
      <th>Srednje Ime</th>
      <th>Prezime</th>
      <th>Datum Rodjenja</th>
      <th>Adresa</th>
      <th>Drzava</th>
      <th>Telefon</th>
      <th>Email</th>
    </tr>
  </xsl:variable>
  <xsl:variable name ="tabelaKompanija">
    <h2>Kompanija</h2>
    <tr>
      <th>Naziv</th>
      <th>Adresa</th>
      <th>Grad</th>
      <th>Drzava</th>
      <th>Telefon</th>
      <th>Email</th>
    </tr>
  </xsl:variable>

  <xsl:template match="adr:Adresar">
    <html>
      <Head>
        <Title>XSLT deo</Title>
      </Head>
      <body>
        <!--Pocetak prvog zadatka-->
        <p>
          <h2>Zadatak 1</h2>
          HTML dokument sa tabelom koja prikazuje sve podatke o Osobama i Kompanijama
          koje sadrže više od dve email adrese
        </p>

        <table border="1">
          <xsl:copy-of select ="$tabelaOsoba"/>
          <xsl:for-each select="adr:Osoba">
            <xsl:if test="count(adr:Email) &gt; 2">
              <tr>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Ime"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Srednje_Ime"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Prezime"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Dan"/>.
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Mesec"/>.
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Godina"/> godine
                </td>
                <td>
                  <xsl:value-of select ="adr:Adresa/adr:Ulica"/> br.
                  <xsl:value-of select ="adr:Adresa/adr:Broj"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Adresa/adr:Drzava"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Telefon"/>
                </td>
                <td>
                  <xsl:for-each select ="adr:Email">
                    <xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <br />
        <table border="1>">
          <xsl:copy-of select ="$tabelaKompanija"/>
          <xsl:for-each select="adr:Kompanija">
            <xsl:if test="count(adr:Email) &gt; 2">
              <tr>
                <td>
                  <xsl:value-of select="adr:Naziv"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Ulica"/> br.
                  <xsl:value-of select="adr:Adresa/adr:Broj"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Grad"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Drzava"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Telefon"/>
                </td>
                <td>
                  <xsl:for-each select ="adr:Email">
                    <xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <p>
          <h3>Zadatak 2</h3>
          Adresa stalna i datum rođenja u opsegu od 1990-2005 godine.
          Prezime počinje sa slovom M i naziv kompanije ima više od 6 karaktera
        </p>

        <!--Pocetak drugog zadatka-->
        <table border="1">
          <xsl:copy-of select ="$tabelaOsoba"/>

          <xsl:for-each select="adr:Osoba">
            <xsl:if test="adr:Adresa/@tip = 'stalna' and number(adr:Datum_Rodjenja/adr:Godina) &gt; 1990 and number(adr:Datum_Rodjenja/adr:Godina) &lt; 2005 and starts-with(adr:Puno_Ime/adr:Prezime,'M')">
              <tr>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Ime"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Srednje_Ime"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Puno_Ime/adr:Prezime"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Dan"/>.
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Mesec"/>.
                  <xsl:value-of select="adr:Datum_Rodjenja/adr:Godina"/> godine
                </td>
                <td>
                  <xsl:value-of select ="adr:Adresa/adr:Ulica"/> br.
                  <xsl:value-of select ="adr:Adresa/adr:Broj"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Adresa/adr:Drzava"/>
                </td>
                <td>
                  <xsl:value-of select ="adr:Telefon"/>
                </td>
                <td>
                  <xsl:for-each select ="adr:Email">
                    <xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <br />
        <table border="1>">
          <xsl:copy-of select ="$tabelaKompanija"/>
          <xsl:for-each select="adr:Kompanija">
            <xsl:if test="string-length(adr:Naziv) &gt; 6">
              <tr>
                <td>
                  <xsl:value-of select="adr:Naziv"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Ulica"/> br.
                  <xsl:value-of select="adr:Adresa/adr:Broj"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Grad"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Adresa/adr:Drzava"/>
                </td>
                <td>
                  <xsl:value-of select="adr:Telefon"/>
                </td>
                <td>
                  <xsl:for-each select ="adr:Email">
                    <xsl:value-of select="."/>
                    <br />
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        
        <!--Pocetak zadatak 3-->



      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

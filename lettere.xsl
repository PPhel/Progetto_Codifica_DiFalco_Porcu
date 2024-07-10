<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Title project: Raccolta della corrispondenza di Amalia Segre Artom con avvisi di intimazione a contribuenti morosi indirizzati ad Emanuele Artom
    Filename:index.xsl
    Authors: Filippo Di Falco and Luca Porcu
    Date: 2024-07
    Last modified: 09/07/2024
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" />
  <xsl:template match="/">
    <html lang="it">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>
          <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
        </title>
        <link href="lettere.css" rel="stylesheet" type="text/css" />
        <script src="lettere.js"></script>
      </head>
      <body>
        <header>
          <h1>
            <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']" />
          </h1>
          <h3>
              <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']" />
          </h3>
        </header>
        <main>
          <section id="descrizione">
            <div class="row">
              <xsl:apply-templates select="//tei:sourceDesc" />
            </div>
            <div class="row">
              <xsl:apply-templates select="//tei:physDesc" />
            </div>
          </section>
          <section id="lettere">
            <h2>Lettera 1</h2>
            <section class="row" id="lettera1">
              <figure class="slideshow-container">
                <xsl:apply-templates select="(//tei:surface)[position() &lt;= 4]" />
              </figure>
              <div id="lettera2">
                <xsl:for-each select="//tei:ab[position() &lt;= 4]">
                  <div id="pagina{position() + 154}" class="pagine">
                    <h1>PAGINA <xsl:value-of select="@n" /></h1>
                    <xsl:apply-templates select="." />
                  </div>
                </xsl:for-each>
              </div>
            </section>
            <h2>Lettera 2</h2>
            <section class="row" id="lettera2">
              <figure class="slideshow-container" >
                <xsl:apply-templates select="//tei:surface[position()=last()]" />
              </figure>
              <div id="pagine_23Feb">
                <xsl:for-each select="//tei:ab[position()=last()]">
                  <div id="pagina{position() + 172}" class="pagine">
                    <h1>PAGINA <xsl:value-of select="@n" /></h1>
                    <xsl:apply-templates select="." />
                  </div>
                </xsl:for-each>
              </div>
            </section>
          </section>
          <nav id="pulsantitesto">
            <button id="correzioni" type="button">Correzioni</button>
            <button id="abbreviazioni" type="button">Abbreviazioni</button>
            <button id="punteggiatura" type="button">Punteggiatura</button>
            <button id="paroleparticolari" type="button">Parole Particolari</button>
            <button id="persone" type="button">Persone</button>
            <button id="luoghi" type="button">Luoghi</button>
            <button id="org" type="button">Organizzazioni</button>
          </nav>
          <section id="informazioni">
            <div id="persone">
              <xsl:apply-templates select="//tei:back/tei:listPerson" />
              <div class="note_persona">
                <xsl:apply-templates select="//tei:person/tei:note" />
              </div>
            </div>
            <div id="luoghi">
              <xsl:apply-templates select="//tei:back/tei:listPlace" />
              <div class="note_luogo">
                <xsl:apply-templates select="//tei:place/tei:desc" />
              </div>
            </div>
            <div id="org">
              <xsl:apply-templates select="//tei:back/tei:listOrg" />
              <div class="note_organizzazione">
                <xsl:apply-templates select="//tei:org/tei:desc" />
              </div>
            </div>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="tei:sourceDesc">
    <div>
      <h2>Informazioni sulle lettere</h2>
      <div>
        <b>Origine:</b>
        <p>
          <xsl:value-of select="//tei:history/tei:origin" />
        </p>
      </div>
      <div>
        <b>Acquisizione:</b>
        <p>
          <xsl:value-of select="//tei:history/tei:acquisition" />
        </p>
      </div>
      <div>
        <b>Luogo di conservazione:</b>
        <p><xsl:value-of select="//tei:distributor/tei:orgName" />.</p>
      </div>
      <div>
        <b>Titolo:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:bibl/tei:title[@type='main']" />
        </p>
      </div>
      <div>
        <b>Autore:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:titleStmt//tei:author" />
        </p>
      </div>
      <div>
        <b>Data:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:msDesc/tei:msContents/tei:msItem/tei:docDate/tei:date" />
        </p>
      </div>
      <div>
        <b>Luogo:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement" />, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:country" />
        </p>
      </div>
      <div>
        <b>Conservazione:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:collection" />
        </p>
      </div>
      <div>
        <b>Codice documento:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:idno" />
        </p>
      </div>
      <div>
        <b>Fruizione:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:sourceDesc/tei:bibl/tei:availability" />
        </p>
      </div>
      <div>
        <b>Lingua:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:textLang" />
        </p>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="tei:physDesc">
    <div>
      <h2 class="styled">Descrizione fisica</h2>
      <div>
        <b>Supporto:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:objectDesc/tei:supportDesc/tei:support" />
        </p>
      </div>
      <div>
        <b>Numero di fogli:</b>
        <p>
          <xsl:value-of select="//tei:objectDesc/tei:supportDesc//tei:measure" />
        </p>
      </div>
      <div>
        <b>Caratteri:</b>
        <p>
          <xsl:text> </xsl:text>
          <xsl:value-of select="//tei:typeDesc" />
        </p>
      </div>
      <div>
        <b>Lunghezza:</b>
        <p>
          <xsl:value-of select="//tei:layoutDesc" />
        </p>
      </div>
      <div>
        <b>Scrittura:</b>
        <p>
          <xsl:value-of select="//tei:handDesc" />
        </p>
      </div>
      <div>
        <b>Condizioni:</b>
        <p>
          <xsl:value-of select="//tei:objectDesc/tei:supportDesc/tei:condition" />
        </p>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="tei:lb">
    <xsl:if test="@n != 1">
      <br />
    </xsl:if>
    <xsl:element name="span">
      <xsl:attribute name="id">
        <xsl:value-of select="@facs" />
      </xsl:attribute>
      <xsl:attribute name="class">numeroRiga</xsl:attribute>
      <xsl:value-of select="@n" />
    </xsl:element>
  </xsl:template>
  <xsl:template match="tei:surface">
    <xsl:element name="img">
      <xsl:attribute name="class">imgDiario</xsl:attribute>
      <xsl:attribute name="title">Immagine pagina <xsl:value-of select="@xml:id" /></xsl:attribute>
      <xsl:attribute name="alt">Immagine pagina <xsl:value-of select="@xml:id" /></xsl:attribute>
      <xsl:attribute name="src">
        <xsl:apply-templates select="tei:graphic/@url" />
      </xsl:attribute>
      <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id" /></xsl:attribute>
    </xsl:element>
    <xsl:element name="map">
      <xsl:attribute name="name">
        <xsl:value-of select="@xml:id" />
      </xsl:attribute>
      <xsl:for-each select="tei:zone">
        <xsl:element name="area">
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id" />
          </xsl:attribute>
          <xsl:attribute name="class">areaRiga</xsl:attribute>
          <xsl:attribute name="coords">
            <xsl:value-of select="@points" />
          </xsl:attribute>
          <xsl:attribute name="shape">poly</xsl:attribute>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template match="tei:corr">
    <span class="corr">
      <xsl:value-of select="." />
    </span>
  </xsl:template>
  <xsl:template match="tei:orig">
    <span class="orig">
      <xsl:value-of select="." />
    </span>
  </xsl:template>
  <xsl:template match="tei:persName">
    <span class="persName">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="tei:placeName">
    <span class="placeName">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="tei:orgName">
    <span class="orgName">
      <xsl:apply-templates />
    </span>
    </xsl:template>
    <xsl:template match="tei:abbr">
      <span class="abbr">
        <xsl:value-of select="." />
      </span>
    </xsl:template>
    <xsl:template match="tei:pc">
      <span class="pc">
        <xsl:value-of select="." />
      </span>
    </xsl:template>
  <xsl:template match="tei:listPerson">
    <h2>Persone</h2>
    <xsl:element name="ul">
      <xsl:for-each select="tei:person[not(@xml:id = 'AMDG' or @xml:id = 'LP' or @xml:id = 'FD')]">
        <xsl:element name="li">
          <span class="persona1">
            <b>
              <xsl:value-of select="tei:persName/tei:forename" />
              <xsl:text> </xsl:text>
              <xsl:value-of select="tei:persName/tei:surname" />
            </b>
          </span>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//tei:person/tei:note">
    <span class="note_p">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="tei:listPlace">
    <h2>Luoghi</h2>
    <xsl:element name="ul">
      <xsl:for-each select="tei:place">
        <xsl:element name="li">
          <span class="luogo">
            <b><xsl:value-of select="tei:placeName" /></b>,
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:country" />
          </span>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//tei:place/tei:desc">
    <span class="note_l">
      <xsl:apply-templates />
    </span>
  </xsl:template>
  <xsl:template match="tei:listOrg">
    <h2>Organizzazioni</h2>
    <xsl:element name="ul">
      <xsl:for-each select="tei:org">
        <xsl:element name="li">
          <span class="organizzazione">
            <b><xsl:value-of select="tei:orgName" /></b>
          </span>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//tei:org/tei:desc">
    <span class="note_o">
      <xsl:apply-templates />
    </span>
  </xsl:template>
   <footer>
    <xsl:template match="tei:editionStmt">
      <h2>Riferimenti</h2>
      <h3>
        <xsl:value-of select="tei:edition" />
      </h3>
      <xsl:for-each select="tei:respStmt">
        <div>
          <b>
            <xsl:value-of select="tei:resp" />
          </b>
          <xsl:for-each select="tei:name">
            <p>
              <xsl:text> </xsl:text>
              <xsl:choose>
                <xsl:when test="position() = last()">
                  <xsl:value-of select="." />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat(., ' e ')" />
                </xsl:otherwise>
              </xsl:choose>
            </p>
          </xsl:for-each>
        </div>
      </xsl:for-each>
    </xsl:template>
  </footer>
</xsl:stylesheet>
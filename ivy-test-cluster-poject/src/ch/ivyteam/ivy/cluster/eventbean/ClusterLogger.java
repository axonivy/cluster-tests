package ch.ivyteam.ivy.cluster.eventbean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;

import ch.ivyteam.ivy.security.exec.Sudo;

public class ClusterLogger {

  public static void logBeanRunningStateChange(String beanName, boolean started) throws IOException {
    File logFile = getLogFile(beanName);
    appendString(logFile, "Bean '" + beanName + "' is '" + (started ? "STARTING" : "STOPPING") + "'");
    File detailLogfile = getDetailLogFile(beanName);
    appendString(detailLogfile, "Bean '" + beanName + "' is '" + (started ? "STARTING" : "STOPPING") + "'" + " on " + InetAddress.getLocalHost().getHostName() + "\n" + ExceptionUtils.getStackTrace(new Exception()) + "\n------------");

  }

  public static String getContentAsSystemUser(String beanName) throws Exception {
    return Sudo.call(() -> ClusterLogger.getContentAsString(beanName));
  }

  public static void deleteEventBeanLogAsSystemUser(String beanName) throws Exception {
    Sudo.run(() -> ClusterLogger.deleteEventBeanLog(beanName));
  }

  private static void deleteEventBeanLog(String beanName) {
    File outputFile = getLogFile(beanName);
    if (outputFile.exists()) {
      outputFile.delete();
    }
    File detailOutputFile = getDetailLogFile(beanName);
    if (detailOutputFile.exists()) {
      detailOutputFile.delete();
    }
  }

  private static String getContentAsString(String beanName) throws IOException {
    var outputFile = getLogFile(beanName);
    if (outputFile.exists()) {
      return FileUtils.readFileToString(outputFile, StandardCharsets.UTF_8);
    }
    return "";
  }

  private static void appendString(File logFile, String message) throws IOException {
    try (FileWriter writer = new FileWriter(logFile, true)) {
      writer.append(message + "\n");
    }
  }

  private static File getLogFile(String beanName) {
    return getFile("log/statechange_" + beanName + ".log");
  }

  private static File getDetailLogFile(String beanName) {
    return getFile("log/statechange_" + beanName + "_detail.log");
  }

  private static File getFile(String path) {
    ch.ivyteam.ivy.scripting.objects.File ivyFile = null;
    try {
      ivyFile = new ch.ivyteam.ivy.scripting.objects.File(path, false);
      ivyFile.createNewFile();
      return ivyFile.getJavaFile();
    } catch (IOException ex) {
      String file = ivyFile != null ? ivyFile.getJavaFile().getPath() : path;
      throw new RuntimeException("Could not get log file '" + file + "'", ex);
    }
  }
}

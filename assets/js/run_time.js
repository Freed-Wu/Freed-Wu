function setzero(i) {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}
window.setTimeout("run_time", 1000);
BirthDay = new Date("01/01/2020 00:00:00");
today = new Date();
timeold = today.getTime() - BirthDay.getTime();
sectimeold = timeold / 1000;
secondsold = Math.floor(sectimeold);
msPerDay = 24 * 60 * 60 * 1000;
e_daysold = timeold / msPerDay;
daysold = Math.floor(e_daysold);
e_hrsold = (e_daysold - daysold) * 24;
hrsold = setzero(Math.floor(e_hrsold));
e_minsold = (e_hrsold - hrsold) * 60;
minsold = setzero(Math.floor((e_hrsold - hrsold) * 60));
seconds = setzero(Math.floor((e_minsold - minsold) * 60));
document.getElementById("run_time").innerHTML =
  daysold + "-" + hrsold + ":" + minsold + ":" + seconds;

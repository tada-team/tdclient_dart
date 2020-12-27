abstract class Constants {
  static const serverDomain = 'ct-stage.tada.team';
  static const teamUid = 'a41c3cfe-bbd4-448d-9737-e498208793ea';

  static final httpServerUri = Uri(scheme: 'https', host: serverDomain);
  static final httpWidgetApiUrl = httpServerUri.replace(path: '/api/v4/widget/');

  static final websocketServerUri = Uri(scheme: 'wss', host: serverDomain);
  static final websocketApiUri = websocketServerUri.replace(
    pathSegments: ['messaging', Constants.teamUid, 'widget'],
  );
}

abstract class EventNames {
  static const serverMessageUpdated = 'server.message.updated';
  static const clientConfirm = 'client.confirm';
}

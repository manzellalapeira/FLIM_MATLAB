function display_label_matrix(L)
% display_label_matrix Display label matrix with custom data cursors
% display_label_matrix(L) displays the label matrix L as colored objects on
% a gray background.  It also installs a custom data cursor handler in the
% figure.  In data cursor mode, clicking on an object displays a data
% cursor containing the object's number.

% Steve Eddins
% Copyright 2006 The MathWorks, Inc.
% $Revision: 1.1 $  $Date: 2006/11/17 19:11:30 $

rgb = label2rgb(L, 'jet', [.7 .7 .7], 'shuffle');
h = imshow(rgb);

% Store the label matrix so that the custom data cursor function has access
% to it.
setappdata(h, 'LabelMatrix', L);

% Enable the figure data cursor mode, and use our own custom data cursor
% strings.
dcm = datacursormode(ancestor(h, 'figure'));
set(dcm,'Enable','on', ...
    'Updatefcn', @dataCursorText);

%==========================================================================
function output_text = dataCursorText(obj, event_obj)
% Respond to a user click in data cursor mode by displaying the label
% number of the pixel that was clicked on.

h_image = get(event_obj, 'Target');
pos = get(event_obj, 'Position');
L = getappdata(h_image, 'LabelMatrix');
clicked_label = L(round(pos(2)), round(pos(1)));
output_text = sprintf('%d', clicked_label);
%--------------------------------------------------------------------------
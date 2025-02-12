import 'package:flutter/material.dart';
import 'package:state/models/post_model.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const PostWidget({
    super.key,
    required this.post,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Text(
                  widget.post.userId.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.post.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //post body

          Text(
            widget.post.body,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                  widget.onLike();
                },
                icon: _isLiked
                    ? (Icon(Icons.favorite))
                    : Icon(Icons.favorite_border),
                color: _isLiked ? Colors.red : Colors.grey,
              ),
              IconButton(
                onPressed: () {
                  widget.onComment;
                },
                icon: Icon(
                  Icons.comment,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                  onPressed: () {
                    widget.onShare;
                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.green,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
